import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 06)
    /// Source: World AeroPress Championship
    static let wacBatch06: [Recipe] = [

        // MARK: - Shuichi Sasaki - 2014 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Shuichi Sasaki - 2014 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17, // 16.5g rounded
            waterAmountGrams: 250,
            waterTemperatureCelsius: 78,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 17 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 40 g water and allow 25 seconds bloom.",
                           durationSeconds: 25,
                           action: .pour,
                           targetWaterWeight: 40,
                           pourAmountGrams: 40),

                RecipeStep(title: "Stir",
                           description: "Stir five times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 210 g water and stir once.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 210),

                RecipeStep(title: "Press",
                           description: "Press down very slowly for 75 seconds. Leave 45 g slurry in brewer.",
                           durationSeconds: 75,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Shuichi Sasaki",
            brewMethod: .upright,
            grindDescription: "Mahlkonig EK43, 9.5",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Martin Karabinos - 2014 - 2nd Place
        Recipe(
            name: "Martin Karabinos - 2014 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 19, // 18.5g rounded
            waterAmountGrams: 215,
            waterTemperatureCelsius: 92,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 19 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cold water addition",
                           description: "Add 80 g water at 35°C. Stir well and leave for 3 minutes.",
                           durationSeconds: 180,
                           action: .pour,
                           targetWaterWeight: 80,
                           pourAmountGrams: 80),

                RecipeStep(title: "Hot water addition",
                           description: "Add 135 g water at 92°C and stir once.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 215,
                           pourAmountGrams: 135),

                RecipeStep(title: "Press",
                           description: "Press down slowly for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Martin Karabinos",
            brewMethod: .upright,
            grindDescription: "Mahlkonig EK43, 6.2",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: 35,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeff Verellen - 2014 - 3rd Place
        Recipe(
            name: "Jeff Verellen - 2014 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18, // 17.5g rounded
            waterAmountGrams: 270,
            waterTemperatureCelsius: 82,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 40 g water at 82°C and bloom for 30 seconds.",
                           durationSeconds: 40,
                           action: .pour,
                           targetWaterWeight: 40,
                           pourAmountGrams: 40),

                RecipeStep(title: "Second pour",
                           description: "Add 230 g water at 76°C over 60 seconds.",
                           durationSeconds: 60,
                           action: .pour,
                           targetWaterWeight: 270,
                           pourAmountGrams: 230),

                RecipeStep(title: "Press",
                           description: "Press gently for 30 seconds. Leave ~50 g slurry in brewer.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Jeff Verellen",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43, 8",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeff Verellen - 2013 - 1st Place
        Recipe(
            name: "Jeff Verellen - 2013 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 270,
            waterTemperatureCelsius: 83,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 17 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom",
                           description: "Bloom 40 seconds with 50 ml water.",
                           durationSeconds: 50,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Second pour",
                           description: "Add 220 g water (total 270 g) at 79°C.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 270,
                           pourAmountGrams: 220),

                RecipeStep(title: "Press",
                           description: "Press slowly for 30 seconds. Leave ~50 g in brewer.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [],
            author: "Jeff Verellen",
            brewMethod: .upright,
            grindDescription: nil,
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Wille Yli-Luoma - 2013 - 2nd Place
        Recipe(
            name: "Wille Yli-Luoma - 2013 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 240,
            waterTemperatureCelsius: 98,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 17 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 240 g water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 240,
                           pourAmountGrams: 240),

                RecipeStep(title: "Steep",
                           description: "Steep for 70 seconds.",
                           durationSeconds: 70,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir",
                           description: "Stir 3 times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press for 25 seconds.",
                           durationSeconds: 25,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [],
            author: "Wille Yli-Luoma",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Tibor Varady - 2013 - 3rd Place
        Recipe(
            name: "Tibor Varady - 2013 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 12,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 90,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 12 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 50 g water and stir 5 times vigorously.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),                           

                RecipeStep(title: "Second pour",
                           description: "Add 150 g water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 150),

                RecipeStep(title: "Steep",
                           description: "Steep for 90 seconds.",
                           durationSeconds: 90,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Place cap, squeeze out air while inverted, turn and press slowly with bodyweight.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [],
            author: "Tibor Varady",
            brewMethod: .inverted,
            grindDescription: "Quite coarse",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}