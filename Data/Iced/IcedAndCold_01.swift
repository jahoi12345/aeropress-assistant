import Foundation

extension RecipeData {

    /// Iced and cold AeroPress recipes (Batch 01)
    static let icedAndColdBatch01: [Recipe] = [

        // MARK: - Alan Adler Cold Brew
        Recipe(
            name: "Alan Adler Cold Brew",
            equipment: .original,
            cupTypes: [.coldBrew],
            coffeeAmountGrams: 15,
            waterAmountGrams: 65,
            waterTemperatureCelsius: 21,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 15 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 65 g of room temperature water over the coffee.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 65,
                           pourAmountGrams: 65),

                RecipeStep(title: "Stir",
                           description: "Stir using the paddle.",
                           durationSeconds: 60,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Insert the plunger and press into the cup.",
                           durationSeconds: 0,
                           action: .press),

                RecipeStep(title: "Serve",
                           description: "Add ice cubes and dilute with cold water or milk to taste.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "Alan Adler",
            brewMethod: .upright,
            grindDescription: "Extra Fine",
            tags: [.concentrate]
        ),

        // MARK: - Dad Got This (Vietnamese Iced Coffee)
        Recipe(
            name: "Dad Got This Vietnamese Iced Coffee",
            equipment: .original,
            cupTypes: [.espressoEsque, .iced],
            coffeeAmountGrams: 40,
            waterAmountGrams: 100,
            waterTemperatureCelsius: 91,
            steps: [
                RecipeStep(title: "First shot coffee",
                           description: "Add 20 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "First pour",
                           description: "Pour 50 g of hot water over the grounds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Swirl",
                           description: "Carefully swirl to mix and steep.",
                           durationSeconds: 30,
                           action: .stir),

                RecipeStep(title: "Press first shot",
                           description: "Fasten cap, flip, and press into cup.",
                           durationSeconds: 0,
                           action: .press),

                RecipeStep(title: "Second shot",
                           description: "Repeat process with remaining 20 g coffee and 50 g water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Serve",
                           description: "Pour over ice and sweetened condensed milk.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "Dad Got This",
            brewMethod: .inverted,
            grindDescription: "Fine",
            tags: [.concentrate]
        ),

        // MARK: - Good Coffee Vibes
        Recipe(
            name: "Good Coffee Vibes",
            equipment: .original,
            cupTypes: [.iced],
            coffeeAmountGrams: 30,
            waterAmountGrams: 150,
            waterTemperatureCelsius: 93,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 30 g of ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "First pour",
                           description: "Pour 100 g of hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir using the paddle.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Second pour",
                           description: "Pour additional 50 g of hot water.",
                           durationSeconds: 75,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 50),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press into glass over ice.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Good Coffee Vibes",
            brewMethod: .inverted,
            grindDescription: "Fine",
            tags: [.concentrate]
        ),

        // MARK: - James Hoffmann Iced Coffee
        Recipe(
            name: "James Hoffmann Iced Coffee",
            equipment: .original,
            cupTypes: [.iced, .bypass],
            coffeeAmountGrams: 22,
            waterAmountGrams: 240,
            waterTemperatureCelsius: 95,
            steps: [
                
                RecipeStep(title: "Prep glass",
                           description: "Fill your cup with 160 g of ice.",
                           durationSeconds: 0,
                           action: .prep),
                
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and attach. Do not rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 22 g of ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour approximately 240 g of hot water.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 240,
                           pourAmountGrams: 240),

                RecipeStep(title: "Steep",
                           description: "Insert the plunger at the top of the brew chamber. Let steep.",
                           durationSeconds: 190,
                           action: .steep),

                RecipeStep(title: "Swirl",
                           description: "Give a gentle swirl.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep Again",
                           description: "Let steep.",
                           durationSeconds: 20,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press gently until hissing into cup filled with ice. Add new ice if needed.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "James Hoffmann",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.bypass]
        ),

        // MARK: - Seattle Coffee Gear
        Recipe(
            name: "Seattle Coffee Gear",
            equipment: .original,
            cupTypes: [.iced],
            coffeeAmountGrams: 24,
            waterAmountGrams: 100,
            waterTemperatureCelsius: 98,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place filter in cap and rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 24 g of ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 100 g of hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir and let sit.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Slowly press into shaker.",
                           durationSeconds: 0,
                           action: .press),

                RecipeStep(title: "Shake",
                           description: "Shake until ice dissolves.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "Seattle Coffee Gear",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.concentrate]
        )
    ]
}