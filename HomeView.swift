    import SwiftUI

/// Subtext options for empty states; one is chosen randomly each time the view is opened.
enum EmptyStateSubtexts {
    static let favoriteRecipes = [
        "It's lonely in here. Find a recipe and tap the star!",
        "Your favorites list is decaf right now. Go add some energy!",
        "Your favorites list is as empty as a mug at 7 AM. Time to start exploring and find your perfect plunge.",
        "Nothing to see here (yet). Go find (or make) a recipe worth waking up for!",
        "Not playing favorites yet? Find a brew worth waking up for.",
        "Empty mug, empty list. Go discover your next daily driver.",
    ]
    static let myRecipes = [
        "Time to play mad scientist. Go experiment!",
        "Time to get in the lab. Cook up something great!",
        "Nothing to see here. Get plunging and save your masterpiece.",
        "Nothing here yet. What's your secret formula going to be?",
    ]
    static let brewJournal = [
        "Did that morning cup taste like bright blueberries or battery acid? Log it here!",
        "Every great cup has a story. Log your first brew here!",
        "Blank pages. Start tracking your daily plunge to find what works.",
        "Your logbook is blank. Start tracking before the caffeine wears off.",
        "Empty journal! Write down your stats before you forget them.",
    ]
    static let beansJournal = [
        "Where have you bean? Add your current roast here!",
        "Your coffee shelf is looking bare. Add a bag of beans to start building your library",
        "No beans listed. Add them here so you never forget a good roast.",
        "Zero beans. Add your stash before you run out.",
    ]
}

struct HomeView: View {
    @EnvironmentObject var data: RecipeData
    @AppStorage(SettingsKeys.feelingLuckyFilter) private var feelingLuckyFilter = "all"
    @AppStorage(SettingsKeys.preferredEquipment) private var preferredEquipment = noPreference
    @AppStorage(SettingsKeys.preferredCupType) private var preferredCupType = noPreference
    @State private var showingLuckyRecipe = false
    @State private var showingCreateRecipe = false
    @State private var selectedLuckyRecipe: Recipe?
    
    var favoriteRecipes: [Recipe] { data.recipes.filter { $0.isFavorite } }
    
    /// Recipe pool for "I'm feeling lucky" based on settings.
    var feelingLuckyPool: [Recipe] {
        switch feelingLuckyFilter {
        case "favorites":
            return Array(favoriteRecipes)
        case "equipment":
            guard !preferredEquipment.isEmpty,
                  let eq = AeroPressEquipment(rawValue: preferredEquipment) else { return data.recipes }
            return data.recipes.filter { $0.equipment == eq }
        case "cup":
            guard !preferredCupType.isEmpty,
                  let ct = CupType(rawValue: preferredCupType) else { return data.recipes }
            return data.recipes.filter { $0.cupTypes.contains(ct) }
        default:
            return data.recipes
        }
    }
    var userRecipes: [Recipe] { data.recipes.filter { $0.isUserCreated } }
    
    // Grouping for equipment
    var xlRecipes: [Recipe] { data.recipes.filter { $0.equipment == .xl && !$0.isUserCreated } }
    var goRecipes: [Recipe] { data.recipes.filter { $0.equipment == .go && !$0.isUserCreated } }
    var originalRecipes: [Recipe] { data.recipes.filter { $0.equipment == .original && !$0.isUserCreated } }
    
    // Grouping for filters/accessories (for Equipment section)
    var aesirFilterRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.aesirFilter) ?? false) && !$0.isUserCreated } }
    var flowControlRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.flowControl) ?? false) && !$0.isUserCreated } }
    var linenFilterRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.linenFilter) ?? false) && !$0.isUserCreated } }
    var meloDripRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.melodrip) ?? false) && !$0.isUserCreated } }
    var metalFilterRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.metalFilter) ?? false) && !$0.isUserCreated } }
    var paperFilterRecipes: [Recipe] { data.recipes.filter { ($0.accessories?.contains(.paperFilter) ?? false) && !$0.isUserCreated } }
    
    // Grouping for cup types
    var regularCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.regular) && !$0.isUserCreated } }
    var espressoCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.espressoEsque) && !$0.isUserCreated } }
    var icedCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.iced) && !$0.isUserCreated } }
    var bypassCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.bypass) && !$0.isUserCreated } }
    var pouroverCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.pourover) && !$0.isUserCreated } }
    var coldBrewCupRecipes: [Recipe] { data.recipes.filter { $0.cupTypes.contains(.coldBrew) && !$0.isUserCreated } }
    
    /// Bottom space so the last section (e.g. Cold Brew) isn’t covered by the tab bar pill.
    private let bottomPillInset: CGFloat = 62

    var body: some View {
        NavigationStack {
            List {
                // MARK: Specials
                Section(header: Text("Personal").padding(.top, -28)) {
                    Button(action: {
                        Haptics.selection()
                        selectedLuckyRecipe = feelingLuckyPool.isEmpty ? nil : feelingLuckyPool.randomElement()
                        showingLuckyRecipe = selectedLuckyRecipe != nil
                    }) {
                        HStack {
                            CategoryRow(title: "I'm feeling lucky", subtitle: nil, iconName: "dice.fill", iconType: .systemImage)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.tertiary)
                        }
                    }
                    .foregroundColor(.primary)
                    
                    NavigationLink(destination: RecipeListView(
                        title: "Favorite Recipes",
                        recipes: favoriteRecipes,
                        emptyStateSystemImage: "star.fill",
                        emptyStateTitle: "No favorites yet.",
                        emptyStateSubtexts: EmptyStateSubtexts.favoriteRecipes
                    )) {
                        CategoryRow(title: "Favorite Recipes", subtitle: "\(favoriteRecipes.count) saved", iconName: "star.fill", iconType: .systemImage)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    
                    NavigationLink(destination: RecipeListView(
                        title: "My Recipes",
                        recipes: userRecipes,
                        emptyStateSystemImage: "person.fill",
                        emptyStateTitle: "No recipes created yet.",
                        emptyStateSubtexts: EmptyStateSubtexts.myRecipes
                    )) {
                        CategoryRow(title: "My Recipes", subtitle: "\(userRecipes.count) created", iconName: "person.fill", iconType: .systemImage)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                }
                
                // MARK: Equipment — full-width row, scroll content reaches screen edges
                Section(header: Text("Equipment")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            NavigationLink(destination: RecipeListView(title: "AeroPress Original", recipes: originalRecipes)) {
                                EquipmentBox(title: "Original", iconName: AeroPressEquipment.original.iconName, iconType: AeroPressEquipment.original.iconType, fixedWidth: 132, iconScale: 1.75)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "AeroPress Go", recipes: goRecipes)) {
                                EquipmentBox(title: "Go", iconName: AeroPressEquipment.go.iconName, iconType: AeroPressEquipment.go.iconType, fixedWidth: 132, iconScale: 1.75)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "AeroPress XL", recipes: xlRecipes)) {
                                EquipmentBox(title: "XL", iconName: AeroPressEquipment.xl.iconName, iconType: AeroPressEquipment.xl.iconType, fixedWidth: 132, iconScale: 2.5)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "Aesir Filter", recipes: aesirFilterRecipes)) {
                                EquipmentBox(title: "Aesir Filter", iconName: "aesirFilter", iconType: .assetImage, fixedWidth: 132, iconScale: 1.59)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "Flow Control", recipes: flowControlRecipes)) {
                                EquipmentBox(title: "Flow Control", iconName: "flowControl", iconType: .assetImage, fixedWidth: 132, iconScale: 1.225)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "Linen Filter", recipes: linenFilterRecipes)) {
                                EquipmentBox(title: "Linen Filter", iconName: "linenFilter", iconType: .assetImage, fixedWidth: 132, iconScale: 1.225)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "MeloDrip", recipes: meloDripRecipes)) {
                                EquipmentBox(title: "MeloDrip", iconName: "meloDrip", iconType: .assetImage, fixedWidth: 132, iconScale: 1.225)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "Metal Filter", recipes: metalFilterRecipes)) {
                                EquipmentBox(title: "Metal Filter", iconName: "metalFilter", iconType: .assetImage, fixedWidth: 132, iconScale: 1.225)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            NavigationLink(destination: RecipeListView(title: "Paper Filter", recipes: paperFilterRecipes)) {
                                EquipmentBox(title: "Paper Filter", iconName: "paperFilter", iconType: .assetImage, fixedWidth: 132, iconScale: 1.225)
                            }
                            .buttonStyle(.plain)
                            .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 0)
                        .padding(.vertical, 4)
                    }
                    .background(ScrollViewOffsetObserver(itemWidth: 132, spacing: 12, leadingPadding: 16, itemCount: 10))
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .listRowBackground(Color.clear)
                }
                
                // MARK: Cup Types
                Section(header: Text("Cup Types")) {
                    NavigationLink(destination: RecipeListView(title: "Regular Cup", recipes: regularCupRecipes)) {
                        CategoryRow(title: "Regular", subtitle: nil, iconName: CupType.regular.iconName, iconType: CupType.regular.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    NavigationLink(destination: RecipeListView(title: "Espresso-style", recipes: espressoCupRecipes)) {
                        CategoryRow(title: "Espresso-style", subtitle: nil, iconName: CupType.espressoEsque.iconName, iconType: CupType.espressoEsque.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    NavigationLink(destination: RecipeListView(title: "Iced", recipes: icedCupRecipes)) {
                        CategoryRow(title: "Iced", subtitle: nil, iconName: CupType.iced.iconName, iconType: CupType.iced.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    NavigationLink(destination: RecipeListView(title: "Bypass", recipes: bypassCupRecipes)) {
                        CategoryRow(title: "Bypass", subtitle: nil, iconName: CupType.bypass.iconName, iconType: CupType.bypass.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    NavigationLink(destination: RecipeListView(title: "Pour-over", recipes: pouroverCupRecipes)) {
                        CategoryRow(title: "Pour-over", subtitle: nil, iconName: CupType.pourover.iconName, iconType: CupType.pourover.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    NavigationLink(destination: RecipeListView(title: "Cold Brew", recipes: coldBrewCupRecipes)) {
                        CategoryRow(title: "Cold Brew", subtitle: nil, iconName: CupType.coldBrew.iconName, iconType: CupType.coldBrew.iconType)
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                }
            }
            .modifier(ReducedTopListMarginModifier())
            .safeAreaInset(edge: .bottom, spacing: 0) {
                Color.clear.frame(height: bottomPillInset)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 0) {
                        Text("AeroPress").foregroundColor(CategoryColors.aeroPressText)
                        Text(" Assistant")
                    }
                    .font(.system(size: 22))
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.mediumImpact() })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Haptics.mediumImpact()
                        showingCreateRecipe = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $showingLuckyRecipe) {
                if let lucky = selectedLuckyRecipe {
                    RecipeDetailView(recipe: lucky)
                }
            }
            .sheet(isPresented: $showingCreateRecipe) {
                CreateRecipeView()
            }
        }
    }
    
    // Replaced by CategoryRow
}

/// Reduces the gap between the nav bar and the first list section (iOS 17+ only; no-op on iOS 16).
private struct ReducedTopListMarginModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content.contentMargins(.top, 0, for: .scrollContent)
        } else {
            content
        }
    }
}

// A reusable sub-list view to display filtered subsets of recipes
struct RecipeListView: View {
    let title: String
    let recipes: [Recipe]
    /// When provided and recipes is empty, shows icon + title + subtext (same style as Brew/Beans Journal). One subtext is chosen randomly each time the view appears.
    var emptyStateSystemImage: String? = nil
    var emptyStateTitle: String? = nil
    var emptyStateSubtexts: [String]? = nil
    
    @State private var displayedEmptySubtext: String?
    
    private var showEmptyState: Bool {
        recipes.isEmpty &&
        emptyStateSystemImage != nil &&
        emptyStateTitle != nil &&
        emptyStateSubtexts != nil &&
        !(emptyStateSubtexts?.isEmpty ?? true)
    }
    
    private var aeroPressTitleView: some View {
        (Text("AeroPress").foregroundColor(CategoryColors.aeroPressText) + Text(" " + String(title.dropFirst("AeroPress ".count))))
    }
    
    var body: some View {
        Group {
            if showEmptyState, let icon = emptyStateSystemImage, let emptyTitle = emptyStateTitle, let subtext = displayedEmptySubtext {
                VStack {
                    Image(systemName: icon)
                        .font(.system(size: 60))
                        .foregroundColor(.secondary)
                    Text(emptyTitle)
                        .font(.headline)
                        .padding(.top, 8)
                    Text(subtext)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            } else {
                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe).modifier(SelectionHapticOnAppear())) {
                        RecipeRowLarge(recipe: recipe)
                    }
                }
            }
        }
        .navigationTitle(title)
        .toolbar {
            if title.hasPrefix("AeroPress ") {
                ToolbarItem(placement: .principal) {
                    aeroPressTitleView
                }
            }
        }
        .onAppear {
            if recipes.isEmpty, let subtexts = emptyStateSubtexts, !subtexts.isEmpty {
                displayedEmptySubtext = subtexts.randomElement()
            }
        }
    }
}

// Visual row for individual recipes in lists
struct RecipeRowLarge: View {
    let recipe: Recipe
    var isSearchResult: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    
    /// Primary cup type for the row icon (first cup type, or regular if none)
    private var primaryCupType: CupType {
        recipe.cupTypes.first ?? .regular
    }
    
    /// Cup type icon color
    private var cupTypeIconColor: Color {
        guard isSearchResult else { return .brown }
        return CategoryColors.cupType
    }
    
    /// Background tint for the cup type icon circle
    private var cupTypeBgColor: Color {
        guard isSearchResult else { return Color.brown.opacity(0.1) }
        return CategoryColors.cupType.opacity(0.12)
    }
    
    /// Icon scale: Regular 30% smaller again (0.735); Iced 30% smaller (1.05); default 1.5
    private var cupTypeIconScale: CGFloat {
        switch primaryCupType {
        case .regular: return 1.5 * 0.7 * 0.7  // 0.735
        case .iced: return 1.5 * 0.7           // 1.05
        default: return 1.5
        }
    }
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                switch primaryCupType.iconType {
                case .systemImage:
                    Image(systemName: primaryCupType.iconName)
                        .font(primaryCupType == .regular || primaryCupType == .iced ? .title3 : .title2)
                        .foregroundColor(cupTypeIconColor)
                case .assetImage:
                    Image(primaryCupType.iconName)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(cupTypeIconScale)
                        .frame(width: 30, height: 30)
                        .clipped()
                        .colorMultiply(cupTypeIconColor)
                case .text:
                    Text(primaryCupType.iconName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(cupTypeIconColor)
                }
            }
            .frame(width: 40, height: 40)
            .background(cupTypeBgColor)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                AeroPressHighlight.text(recipe.name)
                    .font(.headline)
                Text("\(recipe.cupTypes.map { $0.rawValue }.joined(separator: ", ")) • \(recipe.ratio)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                recipeChips
            }
            Spacer()
            if recipe.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Recipe Chips
    
    @ViewBuilder
    private var recipeChips: some View {
        let chips = buildChips()
        if !chips.isEmpty {
            FlowLayout(spacing: 4) {
                ForEach(chips, id: \.label) { chip in
                    RecipeChip(label: chip.label, color: chip.color)
                }
            }
        }
    }
    
    private struct ChipData {
        let label: String
        let color: Color
    }
    
    private func buildChips() -> [ChipData] {
        var chips: [ChipData] = []
        
        // Equipment
        chips.append(ChipData(label: recipe.equipment.rawValue.replacingOccurrences(of: "AeroPress ", with: ""), color: CategoryColors.equipment))
        
        // Brew method
        if let method = recipe.brewMethod {
            chips.append(ChipData(label: method.rawValue, color: CategoryColors.brewMethod))
        }
        
        // Tags
        if let tags = recipe.tags {
            for tag in tags {
                // Skip duplicating brew method tags
                if tag == .upright || tag == .inverted { continue }
                let label: String
                switch tag {
                case .championship: label = "Championship"
                case .bypass: label = "Bypass"
                case .iced: label = "Iced"
                case .diluted: label = "Bypass"
                case .flowControl: label = "Flow Control"
                case .concentrate: label = "Concentrate"
                default: label = tag.rawValue.capitalized
                }
                let color = tag == .championship ? CategoryColors.championship : CategoryColors.tags
                chips.append(ChipData(label: label, color: color))
            }
        }
        
        // Accessories
        if let accessories = recipe.accessories {
            for acc in accessories {
                chips.append(ChipData(label: acc.rawValue, color: CategoryColors.accessories))
            }
        }
        
        return chips
    }
}

// MARK: - Recipe Chip

struct RecipeChip: View {
    let label: String
    let color: Color
    
    var body: some View {
        Text(label)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(color)
            .padding(.horizontal, 7)
            .padding(.vertical, 3)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

// MARK: - Flow Layout

/// A simple flow layout that wraps children to the next line when they overflow.
struct FlowLayout: Layout {
    var spacing: CGFloat = 4
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: ProposedViewSize(width: bounds.width, height: bounds.height), subviews: subviews)
        for (index, pos) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + pos.x, y: bounds.minY + pos.y), proposal: .unspecified)
        }
    }
    
    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var totalHeight: CGFloat = 0
        var totalWidth: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth && x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            totalWidth = max(totalWidth, x - spacing)
            totalHeight = y + rowHeight
        }
        
        return (CGSize(width: totalWidth, height: totalHeight), positions)
    }
}

struct CategoryRow: View {
    let title: String
    let subtitle: String?
    let iconName: String
    let iconType: IconType
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                switch iconType {
                case .systemImage:
                    Image(systemName: iconName)
                        .font(.title2)
                        .foregroundColor(.brown)
                case .assetImage:
                    Image(iconName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.brown)
                case .text:
                    Text(iconName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                }
            }
            .frame(width: 40, height: 40)
            .background(Color.brown.opacity(0.1))
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

/// Vertical box for equipment: icon on top (tall form factor), title below. Optional fixed width for horizontal scroll.
struct EquipmentBox: View {
    let title: String
    let iconName: String
    let iconType: IconType
    var fixedWidth: CGFloat? = nil
    var iconScale: CGFloat = 2.5
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                switch iconType {
                case .systemImage:
                    Image(systemName: iconName)
                        .font(.system(size: 28))
                        .foregroundColor(.brown)
                case .assetImage:
                    Image(iconName)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(iconScale)
                        .colorMultiply(Color.brown)
                        .contrast(1.2)
                        .brightness(0.05)
                case .text:
                    Text(iconName)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 208)
            .clipped()
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: fixedWidth, alignment: .top)
        .padding(28)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
        .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
    }
}
