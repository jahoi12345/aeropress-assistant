import Foundation

class RecipeData: ObservableObject {
    @Published var recipes: [Recipe]
    @Published var journalEntries: [JournalEntry]
    @Published var beans: [Bean]
    
    init() {
        self.recipes = RecipeData.allBuiltInRecipes
        self.journalEntries = []
        self.beans = []
    }
    
    /// Aggregates every recipe from the Data/ folder.
    /// Each category file provides a static array via extension.
    static var allBuiltInRecipes: [Recipe] {
        var all: [Recipe] = []
        // Regular
        all.append(contentsOf: regularCupBatch01)
        all.append(contentsOf: regularCupBatch02)
        all.append(contentsOf: regularCupBatch03)
        all.append(contentsOf: regularCupBatch04)
        all.append(contentsOf: regularCupBatch05)
        all.append(contentsOf: regularCupBatch06)
        // Espresso
        all.append(contentsOf: espressoBatch01)
        // Iced
        all.append(contentsOf: icedAndColdBatch01)
        // WAC
        all.append(contentsOf: wacBatch01)
        all.append(contentsOf: wacBatch02)
        all.append(contentsOf: wacBatch03)
        all.append(contentsOf: wacBatch04)
        all.append(contentsOf: wacBatch05)
        all.append(contentsOf: wacBatch06)
        all.append(contentsOf: wacBatch07)
        all.append(contentsOf: wacBatch08)
        return all
    }
}
