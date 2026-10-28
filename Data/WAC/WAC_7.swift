import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 07)
    /// Source: World AeroPress Championship
    static let wacBatch07: [Recipe] = [

        // MARK: - Charlene de Buysere - 2012 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Charlene de Buysere - 2012 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18, // 18.3g rounded
            waterAmountGrams: 250,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                           
                RecipeStep(title: "Bloom",
                           description: "Add approximately 40 g water and bloom for about 30 seconds.",
                           durationSeconds: 40,
                           action: .pour,
                           targetWaterWeight: 40,
                           pourAmountGrams: 40),

                RecipeStep(title: "Main pour",
                           description: "Add remaining water up to 250g (add 210g) and press, not all the way through.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 210),

                RecipeStep(title: "Serve",
                           description: "Serve.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Charlene de Buysere",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Ingri Margrethe - 2012 - 2nd Place
        Recipe(
            name: "Ingri Margrethe - 2012 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 260,
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(title: "Preheat",
                           description: "Preheat AeroPress by pouring hot water into the brew chamber and swirling.",
                           durationSeconds: 10,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 17 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Add 260 g water at 96°C. No stirring.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 260,
                           pourAmountGrams: 260),

                RecipeStep(title: "Steep",
                           description: "Steep for 50 seconds.",
                           durationSeconds: 50,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press slowly for 20 seconds. Stop before air comes out.",
                           durationSeconds: 20,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cool & pour",
                           description: "Let fines sink and temperature cool before pouring.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Ingri Margrethe",
            brewMethod: .inverted,
            grindDescription: "Fine (Mahlkönig Tanzania)",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeff Verellen - 2011 - 1st Place
        Recipe(
            name: "Jeff Verellen - 2011 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 270,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Wet paper filter and fit tightly into AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 17 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom",
                           description: "Wet grounds with about 40 g water and bloom for 30 seconds.",
                           durationSeconds: 40,
                           action: .pour,
                           targetWaterWeight: 40,
                           pourAmountGrams: 40),

                RecipeStep(title: "Main pour",
                           description: "Slowly pour remaining water up to 270g (add 230g).",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 270,
                           pourAmountGrams: 230),

                RecipeStep(title: "Steep & drip",
                           description: "Let steep about 1 minute, and let the water drip 1/4 through.",
                           durationSeconds: 60,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Help about 2/4th of the rest of the water through, with the provided piston, very gently.",
                           durationSeconds: 20,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Remove excess",
                           description: "Remove press and discard remaining ~50 g from recipient.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Jeff Verellen",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Joshua Wismans - 2011 - 2nd Place
        Recipe(
            name: "Joshua Wismans - 2011 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: nil,
            waterTemperatureCelsius: nil,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add water",
                           description: "Add one plunger of water poured aggressively.",
                           durationSeconds: 5,
                           action: .pour,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Steep for 30 seconds.",
                           durationSeconds: 30,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir",
                           description: "Stir.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [],
            author: "Joshua Wismans",
            brewMethod: .upright,
            grindDescription: "Finer than drip (4.5 on Ditting)",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),
    ]
}