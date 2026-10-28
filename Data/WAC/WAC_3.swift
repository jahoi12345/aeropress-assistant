import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 03)
    /// Source: World AeroPress Championship
    static let wacBatch03: [Recipe] = [

        // MARK: - Tuomas Merikanto - 2021 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Tuomas Merikanto - 2021 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee in the inverted AeroPress. Rinse filters.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 50 g water at 80°C.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Stir",
                           description: "Stir very gently 3 times back and forth.",
                           durationSeconds: 5,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Pour 150g of water at 80°C.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 150),

                RecipeStep(title: "Steep",
                           description: "Steep for 20 seconds.",
                           durationSeconds: 20,
                           action: .steep),

                RecipeStep(title: "Stir",
                           description: "Stir very gently 3 more times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cap & brew",
                           description: "Push excess air out, attach filter cap and let brew for 40 seconds.",
                           durationSeconds: 40,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press for 20 seconds.",
                           durationSeconds: 20,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Swirl & serve",
                           description: "Swirl from 2:00–2:30 to cool and pour into another pitcher.",
                           durationSeconds: 30,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Tuomas Merikanto",
            brewMethod: .inverted,
            grindDescription: "Macap Labo 70D, setting 7.0",
            filterNotes: "Two filters, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Maru Mallee - 2021 - 2nd Place
        Recipe(
            name: "Maru Mallee - 2021 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 186, // 150g brew + 36g dilution
            waterTemperatureCelsius: 93,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                
                RecipeStep(title: "Pour water",
                           description: "Pour 150 g water at 93°C.",
                           durationSeconds: 12,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 150),

                RecipeStep(title: "Stir",
                           description: "Stir 20 times firmly.",
                           durationSeconds: 13,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Attach cap",
                           description: "Attach cap and press out extra air.",
                           durationSeconds: 5,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Steep for 80 seconds.",
                           durationSeconds: 80,
                           action: .steep),

                RecipeStep(title: "Flip",
                           description: "Flip and swirl 3 times and tap down x2 (like rao-spin).",
                           durationSeconds: 5,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press gently.",
                           durationSeconds: 20,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Add 36 g room temperature water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 186,
                           pourAmountGrams: 36)
            ],
            accessories: [.paperFilter],
            author: "Maru Mallee",
            brewMethod: .inverted,
            grindDescription: "Macap Labo 70D, setting 6.7",
            filterNotes: "One filter, rinsed",
            bypassWaterGrams: 36,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Brandon Smith - 2021 - 3rd Place
        Recipe(
            name: "Brandon Smith - 2021 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 220, // 140g brew + 80g dilution
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee to inverted AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour 140 g water within 10 seconds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 140,
                           pourAmountGrams: 140),

                RecipeStep(title: "Stir",
                           description: "Stir gently 5 times.",
                           durationSeconds: 5,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Steep for 70 seconds.",
                           durationSeconds: 70,
                           action: .steep),

                RecipeStep(title: "Flip & press",
                           description: "Flip at 1:25 and press for 30 seconds.",
                           durationSeconds: 35,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Dilute with 80 g water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 220,
                           pourAmountGrams: 80)
            ],
            accessories: [.paperFilter],
            author: "Brandon Smith",
            brewMethod: .inverted,
            grindDescription: "Macap Labo 70D, setting 3.3",
            filterNotes: "One filter, rinsed",
            bypassWaterGrams: 80,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Wendelien van Bunnik - 2019 - 1st Place
        Recipe(
            name: "Wendelien van Bunnik - 2019 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 30,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 92,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 30 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                
                RecipeStep(title: "First pour",
                           description: "Pour 100 g of water in 10 seconds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir firmly 20 times in 10 seconds.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Put the filter cap with rinsed filter on the brewer and gently press out excess air.",
                           durationSeconds: 20,
                           action: .steep),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press out all coffee.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: 60),

                RecipeStep(title: "Dilute",
                           description: "Add 100 g water, then adjust to taste (around 120 g dilution).",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.aesirFilter],
            author: "Wendelien van Bunnik",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43S, 7/10",
            filterNotes: "Aesir filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Benja Khemacheva - 2019 - 2nd Place
        Recipe(
            name: "Benja Khemacheva - 2019 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 35,
            waterAmountGrams: 210,
            waterTemperatureCelsius: 94,
            steps: [
                
                RecipeStep(title: "Add coffee",
                           description: "Add 35 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add server water",
                           description: "Add 110 g water at 94°C into server.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 110,
                           pourAmountGrams: 110),

                RecipeStep(title: "Add coffee",
                           description: "Add 35 g ground coffee into chamber. Place both filters inside the cap and rinse.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Add 100 g water into chamber.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir 15 sec and turbulent wiggle 10 sec.",
                           durationSeconds: 25,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Steep for 40 seconds.",
                           durationSeconds: 40,
                           action: .steep),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press for 30 sec.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .metalFilter, .doubleFilter],
            author: "Benja Khemacheva",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43S, 8/10",
            filterNotes: "1 Paper & 1 Metal, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Alexis Gagnaire - 2019 - 3rd Place
        Recipe(
            name: "Alexis Gagnaire - 2019 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 30,
            waterAmountGrams: 205,
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 30 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),
                
                RecipeStep(title: "First pour",
                           description: "Pour 75 mL water.",
                           durationSeconds: 25,
                           action: .pour,
                           targetWaterWeight: 75,
                           pourAmountGrams: 75),

                RecipeStep(title: "Stir",
                           description: "At 25 sec stir 3 times.",
                           durationSeconds: 5,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Initial press",
                           description: "At 30 sec press a bit and remove plunger.",
                           durationSeconds: 10,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add water",
                           description: "Add 30 mL room temperature water and 30 mL hot water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil),
                
                RecipeStep(title: "Steep",
                           description: "Steep for 40 seconds.",
                           durationSeconds: 40,
                           action: .steep),

                RecipeStep(title: "Final press",
                           description: "Press gently for 10–15 sec.",
                           durationSeconds: 15,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.aesirFilter],
            author: "Alexis Gagnaire",
            brewMethod: .inverted,
            grindDescription: "Comandante, 34 clicks",
            filterNotes: "Aesir filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}