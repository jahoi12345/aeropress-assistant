import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 08)
    /// Source: World AeroPress Championship
    static let wacBatch08: [Recipe] = [

        // MARK: - Marie Hagemeister - 2010 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Marie Hagemeister - 2010 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: nil,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Prep",
                           description: "Invert AeroPress and rinse paper filter with hot water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour 80°C water (apx 250g) almost to the top.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 250),

                RecipeStep(title: "Stir",
                           description: "Stir for 10–12 seconds.",
                           durationSeconds: 12,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Slowly press into heated cup. Stop before hiss.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Marie Hagemeister",
            brewMethod: .inverted,
            grindDescription: "Slightly finer than filter",
            filterNotes: "Paper filter, rinsed with hot water",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeppe Hasager - 2010 - 2nd Place
        Recipe(
            name: "Jeppe Hasager - 2010 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 230,
            waterTemperatureCelsius: 75,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour 230 g water at 75°C slowly while twisting AeroPress.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 230,
                           pourAmountGrams: 230),

                RecipeStep(title: "Stir",
                           description: "Stir gently for 10 seconds.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),
                RecipeStep(title: "Steep",
                           description: "Steep for 45 seconds.",
                           durationSeconds: 45,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press gently for ~30 seconds. Stop when surface breaks.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir & serve",
                           description: "Stir coffee and serve approximately 200 ml.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Jeppe Hasager",
            brewMethod: .inverted,
            grindDescription: "Slightly coarser than filter (3.25 Brew Bar)",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeff Verellen - 2010 - 3rd Place
        Recipe(
            name: "Jeff Verellen - 2010 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: nil,
            waterTemperatureCelsius: 82,
            steps: [
                RecipeStep(title: "Preheat",
                           description: "Blind press with hot water to heat system and rinse filter.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Flip Aeropress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour & rotate",
                           description: "Pour water slowly while rotating base (about 30 seconds).",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: nil),

                RecipeStep(title: "Wait",
                           description: "Attach filter and wait 60 seconds.",
                           durationSeconds: 60,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Invert and press very slowly. Stop before hissing sound.",
                           durationSeconds: 60,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Jeff Verellen",
            brewMethod: .inverted,
            grindDescription: "One bit finer than filter (4 on Ditting)",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Lukasz Jura - 2009 - 1st Place
        Recipe(
            name: "Lukasz Jura - 2009 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 75,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                
                RecipeStep(title: "Pour water",
                           description: "Pour 200 g water at 75°C.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 200),

                RecipeStep(title: "Stir",
                           description: "Stir 4 times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Secure filter and turn at ~10 seconds (total contact ~15 sec).",
                           durationSeconds: 15,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press and serve.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Lukasz Jura",
            brewMethod: .inverted,
            grindDescription: "Slightly coarser than filter",
            filterNotes: "Paper filter, soaked",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Ben Kaminsky - 2009 - 2nd Place
        Recipe(
            name: "Ben Kaminsky - 2009 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 14,
            waterAmountGrams: 190,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Preheat",
                           description: "Blind press with boiling hot water to heat system and rinse filter.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Flip Aeropress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                

                RecipeStep(title: "Add first water",
                           description: "Add 95 g water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 95,
                           pourAmountGrams: 95),

                RecipeStep(title: "Add coffee & stir",
                           description: "Add 14 g coffee and quickly stir to saturate.",
                           durationSeconds: 10,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second water",
                           description: "Add remaining ~95 g water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 190,
                           pourAmountGrams: 95),

                RecipeStep(title: "Steep",
                           description: "Steep for 20 seconds.",
                           durationSeconds: 20,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Press for ~25 seconds until hissing.",
                           durationSeconds: 25,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Ben Kaminsky",
            brewMethod: .inverted,
            grindDescription: "Slightly finer than filter",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        
    ]
}