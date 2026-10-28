import SwiftUI
import UIKit

/// Central haptic feedback for the app. Use for buttons, toggles, selections, and scroll.
@MainActor
enum Haptics {

    /// Selection feedback (e.g. picker value changed, list row selected, tab change).
    static func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }

    /// Light impact (e.g. toggles, scroll snap, light button press).
    static func lightImpact() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }

    /// Medium impact (e.g. Settings, Add/Create primary actions).
    static func mediumImpact() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}

// MARK: - Selection haptic for pushed recipe rows

/// Plays selection feedback the first time a pushed view appears.
/// Use on the destination of recipe rows instead of `.simultaneousGesture(TapGesture())`,
/// which swallows the row tap in those Lists so the NavigationLink never pushes.
struct SelectionHapticOnAppear: ViewModifier {
    @State private var hasPlayed = false

    func body(content: Content) -> some View {
        content.onAppear {
            guard !hasPlayed else { return }
            hasPlayed = true
            Haptics.selection()
        }
    }
}

// MARK: - Scroll offset observer for equipment strip haptics

/// Observes a horizontal ScrollView's content offset and triggers light impact when the centered item index changes.
struct ScrollViewOffsetObserver: UIViewRepresentable {
    let itemWidth: CGFloat
    let spacing: CGFloat
    let leadingPadding: CGFloat
    let itemCount: Int

    private static let cooldown: TimeInterval = 0.2

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        guard context.coordinator.observedScrollView == nil else { return }
        DispatchQueue.main.async {
            guard let scrollView = Self.findScrollView(from: view) else { return }
            context.coordinator.observedScrollView = scrollView
            context.coordinator.layoutParams = (itemWidth: itemWidth, spacing: spacing, leadingPadding: leadingPadding, itemCount: itemCount)
            context.coordinator.attachDelegate(to: scrollView)
        }
    }

    static func findScrollView(from view: UIView, depth: Int = 0) -> UIScrollView? {
        guard depth < 25 else { return nil }
        if let sv = view as? UIScrollView, sv.contentSize.width > sv.bounds.width {
            return sv
        }
        for sub in view.subviews {
            if let sv = findScrollView(from: sub, depth: depth + 1) { return sv }
        }
        if let superview = view.superview {
            return findScrollView(from: superview, depth: depth + 1)
        }
        return nil
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    @MainActor
    class Coordinator: NSObject, UIScrollViewDelegate {
        weak var observedScrollView: UIScrollView?
        var layoutParams: (itemWidth: CGFloat, spacing: CGFloat, leadingPadding: CGFloat, itemCount: Int)?
        var lastCenteredIndex: Int?
        var lastHapticTime: Date = .distantPast

        func attachDelegate(to scrollView: UIScrollView) {
            scrollView.delegate = self
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard let params = layoutParams else { return }
            let totalItemWidth = params.itemWidth + params.spacing
            let containerWidth = scrollView.bounds.width
            let offsetX = scrollView.contentOffset.x
            let centerX = offsetX + containerWidth / 2 - params.leadingPadding
            let rawIndex = centerX / totalItemWidth
            let index = max(0, min(params.itemCount - 1, Int(round(rawIndex))))
            if index != lastCenteredIndex {
                lastCenteredIndex = index
                if Date().timeIntervalSince(lastHapticTime) >= ScrollViewOffsetObserver.cooldown {
                    lastHapticTime = Date()
                    Haptics.lightImpact()
                }
            }
        }
    }
}
