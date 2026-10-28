import SwiftUI

// MARK: - Tab Enum

enum AppTab: String, CaseIterable {
    case recipes = "Recipes"
    case brews = "Brews"
    case beans = "Beans"
    
    var systemImage: String? {
        switch self {
        case .recipes: return "list.bullet.clipboard"
        case .brews: return "book.pages"
        case .beans: return nil
        }
    }
    
    var assetImage: String? {
        switch self {
        case .beans: return "coffee-beans"
        default: return nil
        }
    }
}

// MARK: - Category Group Colors

/// Unified color scheme for search category groups and recipe tag chips.
struct CategoryColors {
    static let equipment = Color.red
    static let aeroPressText = Color.red  // Same red as "AeroPress" on recipes page
    static let cupType = Color.orange
    static let brewMethod = Color.blue
    static let tags = Color.purple
    static let championship = Color.yellow
    static let accessories = Color.green
}

/// Renders a string with "AeroPress" (case-insensitive) in the standard AeroPress red.
struct AeroPressHighlight {
    static func text(_ string: String) -> Text {
        var result = Text(verbatim: "")
        var remaining = string
        while let range = remaining.range(of: "AeroPress", options: .caseInsensitive) {
            let before = String(remaining[..<range.lowerBound])
            let match = String(remaining[range])
            remaining = String(remaining[range.upperBound...])
            if !before.isEmpty { result = result + Text(verbatim: before) }
            result = result + Text(verbatim: match).foregroundColor(CategoryColors.aeroPressText)
        }
        if !remaining.isEmpty { result = result + Text(verbatim: remaining) }
        return result
    }
}

// MARK: - Search Category

struct SearchCategory: Identifiable {
    let id = UUID()
    let label: String
    let color: Color
    let recipes: (RecipeData) -> [Recipe]
}

extension SearchCategory {
    static func allCategories() -> [(group: String, items: [SearchCategory])] {
        [
            ("Equipment", [
                SearchCategory(label: "Original", color: CategoryColors.equipment) { $0.recipes.filter { $0.equipment == .original } },
                SearchCategory(label: "Go", color: CategoryColors.equipment) { $0.recipes.filter { $0.equipment == .go } },
                SearchCategory(label: "XL", color: CategoryColors.equipment) { $0.recipes.filter { $0.equipment == .xl } },
            ]),
            ("Cup Types", [
                SearchCategory(label: "Regular", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.regular) } },
                SearchCategory(label: "Espresso-style", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.espressoEsque) } },
                SearchCategory(label: "Iced", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.iced) } },
                SearchCategory(label: "Bypass", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.bypass) } },
                SearchCategory(label: "Pour-over", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.pourover) } },
                SearchCategory(label: "Cold Brew", color: CategoryColors.cupType) { $0.recipes.filter { $0.cupTypes.contains(.coldBrew) } },
            ]),
            ("Brew Method", [
                SearchCategory(label: "Upright", color: CategoryColors.brewMethod) { $0.recipes.filter { $0.brewMethod == .upright } },
                SearchCategory(label: "Inverted", color: CategoryColors.brewMethod) { $0.recipes.filter { $0.brewMethod == .inverted } },
            ]),
            ("Tags", [
                SearchCategory(label: "Championship", color: CategoryColors.championship) { $0.recipes.filter { $0.tags?.contains(.championship) ?? false } },
                SearchCategory(label: "Bypass", color: CategoryColors.tags) { $0.recipes.filter { $0.tags?.contains(.bypass) ?? false } },
                SearchCategory(label: "Concentrate", color: CategoryColors.tags) { $0.recipes.filter { $0.tags?.contains(.concentrate) ?? false } },
            ]),
            ("Accessories", [
                SearchCategory(label: "Flow Control Cap", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.flowControl) ?? false } },
                SearchCategory(label: "Metal Filter", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.metalFilter) ?? false } },
                SearchCategory(label: "Paper Filter", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.paperFilter) ?? false } },
                SearchCategory(label: "Aesir Filter", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.aesirFilter) ?? false } },
                SearchCategory(label: "Double Filter", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.doubleFilter) ?? false } },
                SearchCategory(label: "Linen Filter", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.linenFilter) ?? false } },
                SearchCategory(label: "Melodrip", color: CategoryColors.accessories) { $0.recipes.filter { $0.accessories?.contains(.melodrip) ?? false } },
            ]),
        ]
    }
}

// MARK: - Main Tab View

struct MainTabView: View {
    @EnvironmentObject var data: RecipeData
    @AppStorage(SettingsKeys.appTheme) private var appTheme = "System"
    @AppStorage(SettingsKeys.textSizeScale) private var textSizeScale = "default"
    
    @State private var selectedTab: AppTab = .recipes
    @State private var isSearchActive = false
    @State private var searchText = ""
    @State private var showingCreateRecipe = false
    @FocusState private var isSearchFocused: Bool
    
    private let barHeight: CGFloat = 50
    
    var filteredRecipes: [Recipe] {
        guard !searchText.isEmpty else { return data.recipes }
        let query = searchText.lowercased()
        return data.recipes.filter { recipe in
            recipe.name.lowercased().contains(query) ||
            recipe.equipment.rawValue.lowercased().contains(query) ||
            recipe.cupTypes.map { $0.rawValue.lowercased() }.contains(where: { $0.contains(query) }) ||
            (recipe.author?.lowercased().contains(query) ?? false) ||
            (recipe.beanSummary?.lowercased().contains(query) ?? false) ||
            (recipe.tags?.contains(where: { $0.rawValue.lowercased().contains(query) }) ?? false) ||
            (recipe.accessories?.contains(where: { $0.rawValue.lowercased().contains(query) }) ?? false) ||
            (recipe.brewMethod?.rawValue.lowercased().contains(query) ?? false)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Active content
            Group {
                if isSearchActive {
                    searchContentView
                } else {
                    switch selectedTab {
                    case .recipes:
                        HomeView()
                    case .brews:
                        JournalView()
                    case .beans:
                        BeansJournalView()
                    }
                }
            }
            .dynamicTypeSize(dynamicTypeSizeFromSetting)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Bottom bar overlay
            GeometryReader { geo in
                let totalWidth = geo.size.width - 32 // 16pt padding each side
                let circleWidth = barHeight
                let spacing: CGFloat = 12
                let pillWidth = max(0, totalWidth - circleWidth - spacing)
                
                HStack(spacing: spacing) {
                    // Left element: full pill (normal) or collapsed circle (search)
                    ZStack {
                        if isSearchActive {
                            // Collapsed circle — tap to go back
                            Button {
                                Haptics.selection()
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.78)) {
                                    isSearchActive = false
                                    searchText = ""
                                    isSearchFocused = false
                                }
                            } label: {
                                Group {
                                    if let sysImg = selectedTab.systemImage {
                                        Image(systemName: sysImg)
                                            .font(.system(size: 18, weight: .semibold))
                                    } else if let assetImg = selectedTab.assetImage {
                                        Image(assetImg)
                                            .renderingMode(.template)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18)
                                    }
                                }
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        } else {
                            // Full pill with tabs
                            HStack(spacing: 0) {
                                ForEach(AppTab.allCases, id: \.self) { tab in
                                    tabButton(for: tab)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                    .frame(width: isSearchActive ? circleWidth : pillWidth, height: barHeight)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.12), radius: 16, x: 0, y: 4)
                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
                    
                    // Right element: search circle (normal) or expanded search pill (search)
                    ZStack {
                        if isSearchActive {
                            // Expanded search pill
                            HStack(spacing: 8) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(.secondary)
                                
                                TextField("Search recipes...", text: $searchText)
                                    .focused($isSearchFocused)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .font(.system(size: 15))
                                
                                if !searchText.isEmpty {
                                    Button {
                                        searchText = ""
                                    } label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .font(.system(size: 15))
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .padding(.horizontal, 14)
                        } else {
                            // Search circle
                            Button {
                                Haptics.selection()
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.78)) {
                                    isSearchActive = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                    isSearchFocused = true
                                }
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                    }
                    .frame(width: isSearchActive ? pillWidth : circleWidth, height: barHeight)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.12), radius: 16, x: 0, y: 4)
                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, -12)
            }
        }
        .preferredColorScheme(colorScheme)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .sheet(isPresented: $showingCreateRecipe) {
            CreateRecipeView()
        }
    }
    
    // MARK: - Search Content View
    
    private var searchContentView: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if searchText.isEmpty {
                    categoryGridView
                } else if filteredRecipes.isEmpty {
                    VStack(spacing: 16) {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 48, weight: .light))
                            .foregroundColor(.secondary.opacity(0.5))
                        Text("No Results")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        Text("Try a different search term")
                            .font(.subheadline)
                            .foregroundColor(.secondary.opacity(0.7))
                        Spacer()
                    }
                } else {
                    List(filteredRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeRowLarge(recipe: recipe, isSearchResult: true)
                        }
                        .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
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
        }
    }
    
    // MARK: - Category Grid View
    
    private var categoryGridView: some View {
        let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
        
        return ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(SearchCategory.allCategories(), id: \.group) { group in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(group.group)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 4)
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(group.items) { category in
                                NavigationLink(destination: RecipeListView(
                                    title: category.label,
                                    recipes: category.recipes(data)
                                )) {
                                    CategoryPill(label: category.label, color: category.color)
                                }
                                .buttonStyle(.plain)
                                .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .padding(.bottom, 100) // space for bottom bar
        }
    }
    
    // MARK: - Tab Button
    
    private func tabButton(for tab: AppTab) -> some View {
        Button {
            Haptics.selection()
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 3) {
                Group {
                    if let systemImage = tab.systemImage {
                        Image(systemName: systemImage)
                            .font(.system(size: 17, weight: selectedTab == tab ? .semibold : .regular))
                    } else if let assetImage = tab.assetImage {
                        Image(assetImage)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 19, height: 19)
                    }
                }
                .foregroundColor(selectedTab == tab ? .red : .secondary)
                
                Text(tab.rawValue)
                    .font(.system(size: 10, weight: selectedTab == tab ? .semibold : .regular))
                    .foregroundColor(selectedTab == tab ? .red : .secondary)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Color Scheme
    
    private var colorScheme: ColorScheme? {
        switch appTheme {
        case "Light": return .light
        case "Dark": return .dark
        default: return nil
        }
    }
    
    private var dynamicTypeSizeFromSetting: DynamicTypeSize {
        switch textSizeScale {
        case "large": return .large
        case "extra": return .xLarge
        default: return .medium
        }
    }
}

// MARK: - Category Pill

struct CategoryPill: View {
    let label: String
    let color: Color
    
    var body: some View {
        Text(label)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(color)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(color.opacity(0.25), lineWidth: 1)
            )
    }
}
