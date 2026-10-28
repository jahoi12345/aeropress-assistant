import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 02)
    /// Source: World AeroPress Championship
    static let wacBatch02: [Recipe] = [

        // MARK: - Tay Wipvassutt - 2023 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Tay Wipvassutt - 2023 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 155, // 100g brew + bypass to 155g
            waterTemperatureCelsius: 89,
            steps: [
                RecipeStep(title: "Add first coffee dose",
                           description: "Put 16 g coffee into the AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour hot water for 100 g.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir for 5 seconds.",
                           durationSeconds: 5,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Wait",
                           description: "Wait 10 seconds.",
                           durationSeconds: 10,
                           action: .steep),

                RecipeStep(title: "Add second coffee dose",
                           description: "Add remaining 2 g coffee.",
                           durationSeconds: 15,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir again",
                           description: "Stir for 5 seconds.",
                           durationSeconds: 5,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cap & expel air",
                           description: "Press down to remove excess air and close the cap.",
                           durationSeconds: 35,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press for about 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: 75),

                RecipeStep(title: "Bypass",
                           description: "Bypass with room temperature water to 115 g, then hot water to 155 g.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 155)
            ],
            accessories: [.paperFilter],
            author: "Tay Wipvassutt",
            brewMethod: .inverted,
            grindDescription: "1ZPresso ZP6, 65 clicks",
            filterNotes: "1 paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Carlo Graf Bülow - 2023 - 2nd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Carlo Graf Bülow - 2023 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 150,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom",
                           description: "Add 50 g water for blooming.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Stir",
                           description: "Stir very fast 32 times.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 110 g of water. Rinse filters.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 160,
                           pourAmountGrams: 110),

                RecipeStep(title: "Lock cap",
                           description: "Lock filter cap.",
                           durationSeconds: 25,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Flip AeroPress.",
                           durationSeconds: 10,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Push slowly.",
                           durationSeconds: 15,
                           action: .press,
                           targetWaterWeight: 135),

                RecipeStep(title: "Dilute",
                           description: "Dilute to 150 g with room temperature water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 150)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Carlo Graf Bülow",
            brewMethod: .inverted,
            grindDescription: "Comandante C40, 32 clicks",
            filterNotes: "2x Classic Paper",
            bypassWaterGrams: 15,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Leon Zhang - 2023 - 3rd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Leon Zhang - 2023 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 235,
            waterTemperatureCelsius: 93,
            steps: [
                RecipeStep(title: "Prep filters & coffee",
                           description: "Use cotton and linen filters, double stacked. Add coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 100 g water at 93°C and stir 15 rounds.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Steep",
                           description: "Steep for 45 seconds.",
                           durationSeconds: 45,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press for 5 seconds.",
                           durationSeconds: 5,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second addition",
                           description: "Add 135 g water at 75°C and stir 5 turns.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 235,
                           pourAmountGrams: 135),

                RecipeStep(title: "Steep",
                           description: "Steep for 10 seconds.",
                           durationSeconds: 10,
                           action: .steep),

                RecipeStep(title: "Final press",
                           description: "Press clean.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .linenFilter, .doubleFilter],
            author: "Leon Zhang",
            brewMethod: .upright,
            grindDescription: "Comandante C40, 27 clicks",
            filterNotes: "1 Cotton, 1 Linen",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jibbi Little - 2022 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Jibbi Little - 2022 - 1st Place",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 150,
            waterTemperatureCelsius: 90,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Pour coffee into chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour & stir",
                           description: "Pour 94 ml of water and stir 35 times gently.",
                           durationSeconds: 80,
                           action: .pour,
                           targetWaterWeight: 94,
                           pourAmountGrams: 94),

                RecipeStep(title: "Cap",
                           description: "Screw on cap and press out remaining air.",
                           durationSeconds: 10,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: 60),

                RecipeStep(title: "Bypass",
                           description: "Bypass 90°C water to 150 g.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 150)
            ],
            accessories: [.paperFilter],
            author: "Jibbi Little",
            brewMethod: .inverted,
            grindDescription: "Timemore coarse + Kinu setting 4, sifted 100–200µm",
            filterNotes: "1 AeroPress Classic, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: 90,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Simon Derutter - 2022 - 2nd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Simon Derutter - 2022 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 156,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Pour coffee into chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour 140 ml of water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 140,
                           pourAmountGrams: 140),

                RecipeStep(title: "Stir",
                           description: "Stir three times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Put the plunger in and pull it back to create a vacuum, let steep.",
                           durationSeconds: 50,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press for 30 seconds until the AeroPress hisses.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: 110),

                RecipeStep(title: "Dilute",
                           description: "Add water for total weight of 156 ml.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 156)
            ],
            accessories: [.paperFilter],
            author: "Simon Derutter",
            brewMethod: .upright,
            grindDescription: "Comandante, 23 clicks",
            filterNotes: "1 Aesir filter, dry",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jennifer Rui Ping - 2022 - 3rd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Jennifer Rui Ping - 2022 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 84,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Pour coffee into chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour 100 ml of water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Bloom",
                           description: "Stir gently and bloom.",
                           durationSeconds: 20,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 100 ml of water and stir gently.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 100),

                RecipeStep(title: "Flip & press",
                           description: "At 1:30 flip and press for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Serve",
                           description: "Aerate and serve.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Jennifer Rui Ping",
            brewMethod: .inverted,
            grindDescription: "Comandante, 30 clicks",
            filterNotes: "1 AeroPress Classic, dry",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}