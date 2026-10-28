import SwiftUI
import AudioToolbox
import UIKit

// MARK: - Step 1 scroll darkening: force-hide scroll indicator (and any track) via UIKit
private struct ScrollViewIndicatorHider: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        v.backgroundColor = .clear
        v.isUserInteractionEnabled = false
        return v
    }

    func updateUIView(_ view: UIView, context: Context) {
        DispatchQueue.main.async {
            guard let scrollView = findScrollView(from: view) else { return }
            scrollView.showsVerticalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
        }
    }

    private func findScrollView(from view: UIView) -> UIScrollView? {
        var current: UIView? = view.superview
        var exclude: UIView? = view
        for _ in 0..<15 {
            guard let c = current else { break }
            if let sv = c as? UIScrollView { return sv }
            for sub in c.subviews where sub !== exclude {
                if let sv = sub as? UIScrollView { return sv }
                if let sv = findScrollViewInTree(sub) { return sv }
            }
            exclude = c
            current = c.superview
        }
        return nil
    }

    private func findScrollViewInTree(_ view: UIView) -> UIScrollView? {
        if let sv = view as? UIScrollView { return sv }
        for sub in view.subviews {
            if let sv = findScrollViewInTree(sub) { return sv }
        }
        return nil
    }
}

// MARK: - Border progress ring (follows screen edge with rounded corners)
private struct BorderRingShape: Shape {
    var inset: CGFloat = 2
    var cornerRadius: CGFloat = 44

    func path(in rect: CGRect) -> Path {
        let r = rect.insetBy(dx: inset, dy: inset)
        return Path(roundedRect: r, cornerRadius: min(cornerRadius, r.width / 2, r.height / 2))
    }
}

struct ActiveBrewView: View {
    let recipe: Recipe
    @StateObject private var timerManager = TimerManager()
    @EnvironmentObject private var data: RecipeData
    @Environment(\.dismiss) private var dismiss
    @AppStorage(SettingsKeys.enableSounds) private var enableSounds = true
    @AppStorage(SettingsKeys.enableAlerts) private var enableAlerts = true
    @AppStorage(SettingsKeys.timeFormat) private var timeFormat = "seconds"

    @State private var showAddBrewSheet = false
    @State private var showAddBeansSheet = false

    private let ringInset: CGFloat = 2
    private let ringLineWidth: CGFloat = 4
    private let dimmedOpacity: Double = 0.3
    private let dimmedScale: CGFloat = 0.76
    private let activeScale: CGFloat = 1.08
    /// Match MainTabView bottom pill: height 50 → Capsule radius 25
    private let controlPillHeight: CGFloat = 50
    /// Bottom space so the control bar is never covered by the tab bar pill (matches HomeView, RecipeDetailView).
    private let bottomPillInset: CGFloat = 62

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                    // Total time & step timer - same line, 50% smaller than before
                    HStack(alignment: .firstTextBaseline) {
                        totalTimeLabel
                        Spacer()
                        stepTimerLabel
                    }
                    .font(.system(size: 30, weight: .medium, design: .monospaced))
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    .padding(.bottom, 8)

                    // Lyrics-style steps (scrollable, current step highlighted)
                    stepLyricsView(in: geo)

                    Spacer(minLength: 0)

                    // Controls (sits above bottom pill; safeAreaInset guarantees they're never covered)
                    controlBar
                }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: bottomPillInset)
        }
        .background(backgroundGradient)
        .overlay(alignment: .topLeading) {
            if recipe.totalTime > 0 {
                GeometryReader { overlayGeo in
                    let screenSize = UIScreen.main.bounds.size
                    let insets = overlayGeo.safeAreaInsets
                    borderProgressRingFullSize(width: screenSize.width, height: screenSize.height)
                        .offset(x: -insets.leading, y: -insets.top)
                }
                .ignoresSafeArea(.all)
            }
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                AeroPressHighlight.text(recipe.name)
                    .font(.system(size: 22))
                    .foregroundStyle(.white.opacity(0.95))
                    .lineLimit(1)
            }
        }
        .toolbarBackground(Color(red: 0.2, green: 0.12, blue: 0.07), for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear {
            timerManager.setup(with: recipe)
            timerManager.onStepCompleted = {
                if enableAlerts {
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }
                if enableSounds {
                    AudioServicesPlaySystemSound(1103)
                }
            }
        }
        .onDisappear {
            timerManager.onStepCompleted = nil
            timerManager.stop()
        }
    }

    // MARK: - Background
    private var backgroundGradient: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.22, green: 0.14, blue: 0.08),
                    Color(red: 0.18, green: 0.11, blue: 0.07)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            LinearGradient(
                colors: [
                    Color.brown.opacity(0.35),
                    Color.clear
                ],
                startPoint: .top,
                endPoint: .center
            )
            LinearGradient(
                colors: [
                    Color.clear,
                    Color(red: 0.15, green: 0.09, blue: 0.05)
                ],
                startPoint: .center,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }

    // MARK: - Total time (elapsed / total, no milliseconds)
    private var totalTimeLabel: some View {
        Group {
            if let recipe = timerManager.recipe {
                let total = recipe.totalTime
                Text("\(formatTime(timerManager.totalTimeElapsed))/\(formatTime(total))")
            } else {
                Text("0:00/0:00")
            }
        }
    }

    // MARK: - Step timer (remaining in current step, no milliseconds)
    private var stepTimerLabel: some View {
        Group {
            if let step = timerManager.currentStep, step.durationSeconds > 0 {
                Text(formatTime(timerManager.timeRemainingInStep))
            } else {
                Text("—")
            }
        }
    }

    // MARK: - Lyrics-style step list
    private func stepLyricsView(in geo: GeometryProxy) -> some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                        stepRow(index: index, step: step)
                            .id(index)
                    }
                    if timerManager.isFinished {
                        Text("Ready! Enjoy your coffee.")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white.opacity(0.95))
                            .padding(.top, 8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
            }
            .scrollContentBackground(.hidden)
            .background(ScrollViewIndicatorHider())
            .onChange(of: timerManager.currentStepIndex) { newIndex in
                withAnimation(.easeInOut(duration: 0.25)) {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func stepRow(index: Int, step: RecipeStep) -> some View {
        // Prep steps: highlight all of them when we're in the prep phase
        let prepEndIndex = recipe.steps.firstIndex(where: { $0.action != .prep }) ?? recipe.steps.count
        let isInPrepPhase = timerManager.currentStepIndex < prepEndIndex && !timerManager.isFinished
        let isPrepStep = index < prepEndIndex
        let isActive = (!timerManager.isFinished && index == timerManager.currentStepIndex)
            || (isInPrepPhase && isPrepStep)
        let opacity = isActive ? 1.0 : dimmedOpacity
        let scale = isActive ? activeScale : dimmedScale

        let box = VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(step.title)
                    .font(isActive ? .title2 : .system(size: 22))
                    .fontWeight(isActive ? .bold : .medium)
                    .foregroundStyle(.white.opacity(opacity))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                if step.durationSeconds > 0 {
                    Text(formatTime(step.durationSeconds))
                        .font(isActive ? .caption : .system(size: 18))
                        .foregroundStyle(.white.opacity(opacity * 0.7))
                }
            }
            if let desc = step.description, !desc.isEmpty {
                Text(desc)
                    .font(isActive ? .body : .system(size: 18))
                    .foregroundStyle(.white.opacity(opacity * 0.85))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, isActive ? 12 : 0)
        .padding(.vertical, isActive ? 10 : 0)
        .background(isActive ? Color.white.opacity(0.15) : Color.clear)
        .clipShape(RoundedRectangle(cornerRadius: isActive ? 12 : 0))

        return HStack(spacing: 0) {
            Spacer(minLength: 8)
            box
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: 8)
        }
        .scaleEffect(scale, anchor: .leading)
        .animation(.easeInOut(duration: 0.2), value: isActive)
    }

    // MARK: - Border progress ring (full window: Step 1 – uses screen size; updates at 120fps via progressForDisplay)
    private func borderProgressRingFullSize(width: CGFloat, height: CGFloat) -> some View {
        let progress = min(1.0, timerManager.progressForDisplay)
        let pathInset = ringInset + ringLineWidth / 2
        let radius = min(55, width / 4, height / 4)
        return ZStack {
            // Track (full ring, dim)
            BorderRingShape(inset: pathInset, cornerRadius: radius)
                .trim(from: 0, to: 1)
                .stroke(Color.white.opacity(0.2), style: StrokeStyle(lineWidth: ringLineWidth, lineCap: .round, lineJoin: .round))

            // Progress fill
            BorderRingShape(inset: pathInset, cornerRadius: radius)
                .trim(from: 0, to: progress)
                .stroke(Color.white, style: StrokeStyle(lineWidth: ringLineWidth, lineCap: .round, lineJoin: .round))
        }
        .frame(width: width, height: height)
        .allowsHitTesting(false)
    }

    /// Font for all control pill labels (Done, Brews, Beans and in-brew buttons).
    private static let controlButtonFont = Font.system(size: 18, weight: .medium, design: .monospaced)

    /// Press feedback: pill turns slightly grey while the user is pressing.
    private struct ControlPillPressStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .overlay(
                    Color.gray.opacity(configuration.isPressed ? 0.3 : 0)
                        .animation(.easeInOut(duration: 0.12), value: configuration.isPressed)
                )
        }
    }

    // MARK: - Controls (single HStack of 3 slots; widths animate like search pill → morph 1 or 2 pills into 3)
    private var controlBar: some View {
        GeometryReader { geo in
            let totalWidth = max(0, geo.size.width)
            let spacing: CGFloat = 12
            let pillW = (totalWidth - 2 * spacing) / 3
            let halfW = (totalWidth - spacing) / 2
            let prepEndIndex = recipe.steps.firstIndex(where: { $0.action != .prep }) ?? recipe.steps.count
            let isInPrepPhase = !timerManager.isFinished && timerManager.currentStepIndex < prepEndIndex
            let hasNoTimedSteps = recipe.totalTime == 0

            let w1: CGFloat = timerManager.isFinished ? pillW : (hasNoTimedSteps || isInPrepPhase ? totalWidth : halfW)
            let w2: CGFloat = timerManager.isFinished ? pillW : (!hasNoTimedSteps && !isInPrepPhase ? halfW : 0)
            let w3: CGFloat = timerManager.isFinished ? pillW : 0

            HStack(spacing: spacing) {
                // Slot 1: Done (finished) | Finish prep / Next Step (no timed) | Play/Pause (timed)
                ZStack {
                    if timerManager.isFinished {
                        Button(action: { dismiss() }) {
                            Text("Done")
                                .font(Self.controlButtonFont)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: controlPillHeight)
                        }
                        .buttonStyle(ControlPillPressStyle())
                    } else if hasNoTimedSteps || isInPrepPhase {
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.78)) {
                                if isInPrepPhase { timerManager.skipPastPrep() } else { timerManager.skipToNextStep() }
                            }
                        }) {
                            Text(isInPrepPhase ? "Finish prep" : "Next Step")
                                .font(Self.controlButtonFont)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: controlPillHeight)
                        }
                        .buttonStyle(ControlPillPressStyle())
                    } else {
                        Button(action: { timerManager.toggle() }) {
                            Image(systemName: timerManager.isRunning ? "pause.fill" : "play.fill")
                                .font(.system(size: 26))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: controlPillHeight)
                        }
                        .buttonStyle(ControlPillPressStyle())
                    }
                }
                .frame(width: w1, height: controlPillHeight)
                .clipped()
                .background(.ultraThinMaterial)
                .clipShape(Capsule())

                // Slot 2: Brews (finished) | Skip / Next Step (timed, post-prep) | empty
                ZStack {
                    if timerManager.isFinished {
                        Button(action: { showAddBrewSheet = true }) {
                            Text("Brews")
                                .font(Self.controlButtonFont)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: controlPillHeight)
                        }
                        .buttonStyle(ControlPillPressStyle())
                    } else if !hasNoTimedSteps, !isInPrepPhase {
                        if timerManager.currentStep?.durationSeconds == 0 {
                            Button(action: {
                                timerManager.skipToNextStep()
                                if !timerManager.isFinished,
                                   (timerManager.currentStep?.durationSeconds ?? 0) > 0,
                                   !timerManager.isRunning { timerManager.start() }
                            }) {
                                Text("Next Step")
                                    .font(Self.controlButtonFont)
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: controlPillHeight)
                            }
                            .buttonStyle(ControlPillPressStyle())
                        } else {
                            Button(action: { timerManager.skipToNextStep() }) {
                                Text("Skip")
                                    .font(Self.controlButtonFont)
                                    .foregroundStyle(.white.opacity(0.9))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: controlPillHeight)
                            }
                            .buttonStyle(ControlPillPressStyle())
                        }
                    }
                }
                .frame(width: w2, height: controlPillHeight)
                .clipped()
                .background(.ultraThinMaterial)
                .clipShape(Capsule())

                // Slot 3: Beans (finished) | empty
                ZStack {
                    if timerManager.isFinished {
                        Button(action: { showAddBeansSheet = true }) {
                            Text("Beans")
                                .font(Self.controlButtonFont)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: controlPillHeight)
                        }
                        .buttonStyle(ControlPillPressStyle())
                    }
                }
                .frame(width: w3, height: controlPillHeight)
                .clipped()
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: controlPillHeight)
        .animation(.spring(response: 0.3, dampingFraction: 0.78), value: timerManager.isFinished)
        .padding(.horizontal, 20)
        .padding(.bottom, 8)
        .padding(.top, 16)
        .sheet(isPresented: $showAddBrewSheet) {
            AddJournalEntryView(initialRecipeName: recipe.name)
        }
        .sheet(isPresented: $showAddBeansSheet) {
            AddBeanView()
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        if timeFormat == "minsec" {
            let m = seconds / 60
            let s = seconds % 60
            return m > 0 ? "\(m):\(String(format: "%02d", s))" : "\(seconds)s"
        }
        let m = seconds / 60
        let s = seconds % 60
        return m > 0 ? "\(m):\(String(format: "%02d", s))" : "\(seconds)s"
    }
}

#Preview {
    ActiveBrewView(recipe: RecipeData.allBuiltInRecipes[0])
        .environmentObject(RecipeData())
}
