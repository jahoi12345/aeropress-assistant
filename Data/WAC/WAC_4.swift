import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 04)
    /// Source: World AeroPress Championship
    static let wacBatch04: [Recipe] = [

        // MARK: - Carolina Garay - 2018 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Carolina Garay - 2018 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 35, // 34.9g rounded
            waterAmountGrams: 200,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 34.9 g coffee to inverted AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour 100 g water for 30 seconds.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir vigorously but carefully with wooden chopsticks for 30 seconds.",
                           durationSeconds: 30,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Attach cap, flip and press for 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Top up",
                           description: "Top up with 60 g of 85°C water and 40 g room temperature water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Carolina Garay",
            brewMethod: .inverted,
            grindDescription: "Mahlkonig EK43S, 8/10",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: 100,
            bypassWaterTempCelsius: 85,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Xiaobo Zhang - 2018 - 2nd Place
        Recipe(
            name: "Xiaobo Zhang - 2018 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 31,
            waterAmountGrams: 220,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 30 g coffee into chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 100 g water in 15 seconds.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir for 15 seconds.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 70 g of water.",
                           durationSeconds: 5,
                           action: .pour,
                           targetWaterWeight: 170,
                           pourAmountGrams: 70),

                RecipeStep(title: "Add fine coffee",
                           description: "Add 1 g of very finely ground coffee.",
                           durationSeconds: 5,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Attach cap, flip and press for 45 seconds.",
                           durationSeconds: 45,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Top up",
                           description: "Top up brew with 50 g of water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 220,
                           pourAmountGrams: 50)
            ],
            accessories: [.paperFilter],
            author: "Xiaobo Zhang",
            brewMethod: .inverted,
            grindDescription: "DM Grind 2 Hand Grinder, 10/10",
            filterNotes: "Kalita 95mm paper filter, rinsed with cold water",
            bypassWaterGrams: 50,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Evgeni Pinchukov - 2018 - 3rd Place
        Recipe(
            name: "Evgeni Pinchukov - 2018 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 30,
            waterAmountGrams: 230,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 30 g coffee into chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 100 g water in 15 seconds.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir for 15 seconds.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 70 g water.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 170,
                           pourAmountGrams: 70),

                RecipeStep(title: "Add fine coffee",
                           description: "Add 1 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Attach cap, flip and press for 45 seconds.",
                           durationSeconds: 45,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Top up",
                           description: "Top up brew with 50 g water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 230,
                           pourAmountGrams: 50)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Evgeni Pinchukov",
            brewMethod: .upright,
            grindDescription: "Comandante Hand Grinder, 8/10",
            filterNotes: "2 paper filters, rinsed",
            bypassWaterGrams: 50,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .upright, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Paulina Miczka - 2017 - 1st Place
        Recipe(
            name: "Paulina Miczka - 2017 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 35,
            waterAmountGrams: 370,
            waterTemperatureCelsius: 84,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Put 35 g of coffee into the AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "0:00–0:15 add 150 g of water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 150),

                RecipeStep(title: "Stir",
                           description: "0:15–0:35 stir continuously.",
                           durationSeconds: 20,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Steep for 30 seconds.",
                           durationSeconds: 30,
                           action: .steep),

                RecipeStep(title: "Flip & press",
                           description: "At 1:05 flip and start pressing. Stop at 1:35.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: 90),

                RecipeStep(title: "Dilute",
                           description: "Add 160–200 g hot water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Paulina Miczka",
            brewMethod: .inverted,
            grindDescription: "8/10",
            filterNotes: "Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: 84,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Yusuke Narisawa - 2017 - 2nd Place
        Recipe(
            name: "Yusuke Narisawa - 2017 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 30, // 28g coarse + 1.5g fine rounded
            waterAmountGrams: 245,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 28 g coarse and 1.5 g fine coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 70 g water and stir 20 times.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 70,
                           pourAmountGrams: 70),

                RecipeStep(title: "Second pour",
                           description: "Add 100 g water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 170,
                           pourAmountGrams: 100),


                RecipeStep(title: "Flip & press",
                           description: "Flip and press slowly until 1:50.",
                           durationSeconds: 65,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Add 75 g hot water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 245,
                           pourAmountGrams: 75)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Yusuke Narisawa",
            brewMethod: .inverted,
            grindDescription: "9/10",
            filterNotes: "Double paper filter",
            bypassWaterGrams: 75,
            bypassWaterTempCelsius: 85,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jeongsu Park - 2017 - 3rd Place
        Recipe(
            name: "Jeongsu Park - 2017 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 30,
            waterAmountGrams: 230,
            waterTemperatureCelsius: 86,
            steps: [
                RecipeStep(title: "Prep filters & coffee",
                           description: "Place metal filter then paper filter into cap. Add coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Add 75 g water at 86°C and stir six times.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 75,
                           pourAmountGrams: 75),

                RecipeStep(title: "Wait",
                           description: "Wait for 45 seconds.",
                           durationSeconds: 45,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Add 75 g water at 86°C and stir five times.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 75),

                RecipeStep(title: "Press",
                           description: "Press for 10 seconds.",
                           durationSeconds: 10,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Add 150 g water at 86°C to brewed coffee.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .metalFilter, .doubleFilter],
            author: "Jeongsu Park",
            brewMethod: .upright,
            grindDescription: "3/10",
            filterNotes: "Metal + Paper filter",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: 86,
            tags: [.championship, .upright, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}