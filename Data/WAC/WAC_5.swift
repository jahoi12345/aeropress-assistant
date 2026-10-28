import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 05)
    /// Source: World AeroPress Championship
    static let wacBatch05: [Recipe] = [

        // MARK: - Filip Kucharczyk - 2016 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Filip Kucharczyk - 2016 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 35,
            waterAmountGrams: 150, // brew water specified; dilution range in steps
            waterTemperatureCelsius: 81,
            steps: [
                
                RecipeStep(title: "Add coffee and rinse filter",
                           description: "Add 35 g coffee and rinse filter.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour",
                           description: "Pour 150 g water over 15 seconds.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 150),

                RecipeStep(title: "Stir",
                           description: "Stir until 30 seconds on timer.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cap & wait",
                           description: "Put lid on and wait until 1:00.",
                           durationSeconds: 30,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & plunge",
                           description: "Invert AeroPress, give it a swirl and plunge.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Add 100–120 g water to taste.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Filip Kucharczyk",
            brewMethod: .inverted,
            grindDescription: "Coarse",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jerome Dittmar - 2016 - 2nd Place
        Recipe(
            name: "Jerome Dittmar - 2016 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: 230,
            waterTemperatureCelsius: nil,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour 40 g water during 10 seconds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 40,
                           pourAmountGrams: 40),

                RecipeStep(title: "Steep",
                           description: "Let it steep for 20 seconds.",
                           durationSeconds: 20,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Pour water until reaching 230g (add 190g) during 40 seconds.",
                           durationSeconds: 40,
                           action: .pour,
                           targetWaterWeight: 230,
                           pourAmountGrams: 190),

                RecipeStep(title: "Press",
                           description: "Push for 40 seconds.",
                           durationSeconds: 40,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [],
            author: "Jerome Dittmar",
            brewMethod: .upright,
            grindDescription: "EK43, 7.5",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Hugo Sousa Rocco - 2016 - 3rd Place
        Recipe(
            name: "Hugo Sousa Rocco - 2016 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 27,
            waterAmountGrams: 170, // brew water specified; dilution to 200g total beverage
            waterTemperatureCelsius: 82,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 27 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 60 g water.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 60,
                           pourAmountGrams: 60),

                RecipeStep(title: "Stir",
                           description: "Stir for 12 seconds.",
                           durationSeconds: 12,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Wait",
                           description: "Wait 1 minute.",
                           durationSeconds: 60,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 110 g water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 170,
                           pourAmountGrams: 110),

                RecipeStep(title: "Wait",
                           description: "Wait 2.5 minutes.",
                           durationSeconds: 150,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Push for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Top up",
                           description: "Top up with water until total beverage reaches 200 g.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 200)
            ],
            accessories: [],
            author: "Hugo Sousa Rocco",
            brewMethod: .upright,
            grindDescription: "Medium coarse (like V60)",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Lukas Zahradnik - 2015 - 1st Place
        Recipe(
            name: "Lukas Zahradnik - 2015 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 20,
            waterAmountGrams: 230,
            waterTemperatureCelsius: 79,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 60 g water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 60,
                           pourAmountGrams: 60),

                RecipeStep(title: "Bloom",
                           description: "Turbulent wiggle for 15 seconds and allow 30 seconds bloom.",
                           durationSeconds: 45,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add remaining water (170g) in 10 seconds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 230,
                           pourAmountGrams: 170),

                RecipeStep(title: "Press",
                           description: "Press down for 45 seconds.",
                           durationSeconds: 45,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Lukas Zahradnik",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43, 7.3",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Nick Hatch - 2015 - 2nd Place
        Recipe(
            name: "Nick Hatch - 2015 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18, // 17.5g rounded
            waterAmountGrams: 260,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                RecipeStep(title: "First pour",
                           description: "Add 50g water and stir five times.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Bloom",
                           description: "Allow 25 seconds of bloom.",
                           durationSeconds: 25,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add remaining water (210g) in 20 seconds.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 260,
                           pourAmountGrams: 210),

                RecipeStep(title: "Press",
                           description: "Press down for 60 seconds.",
                           durationSeconds: 60,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Nick Hatch",
            brewMethod: .upright,
            grindDescription: "Baratza Virtuoso, setting 17",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Kaye Joy Ong - 2015 - 3rd Place
        Recipe(
            name: "Kaye Joy Ong - 2015 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 23, // 22.5g rounded
            waterAmountGrams: 280,
            waterTemperatureCelsius: 79,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 23 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 56 g water and allow 30 seconds bloom.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 56,
                           pourAmountGrams: 56),

                RecipeStep(title: "Second pour",
                           description: "Add remaining water (224g) over 60 seconds.",
                           durationSeconds: 60,
                           action: .pour,
                           targetWaterWeight: 280,
                           pourAmountGrams: 224),

                RecipeStep(title: "Press",
                           description: "Press down for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Kaye Joy Ong",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43, setting 4",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}