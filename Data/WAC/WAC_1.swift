import Foundation

extension RecipeData {

    /// WAC recipes (2025–2024 Batch 01)
    /// Source: World AeroPress Championship
    static let wacBatch01: [Recipe] = [

        // MARK: - Némo Pop - 2025 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Némo Pop - 2025 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 170, // 100g brew + 70g bypass
            waterTemperatureCelsius: 84,
            steps: [
                RecipeStep(title: "Add bypass water",
                           description: "Pour 70 g of bypass water into carafe (50°C).",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 70,
                           pourAmountGrams: 70),

                RecipeStep(title: "Add coffee",
                           description: "Add 18 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour brew water",
                           description: "Pour 100 g of brewing water into the AeroPress.",
                           durationSeconds: 25,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir NSNS-WEWE.",
                           durationSeconds: 25,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "At 50 seconds, gently press for about 20 seconds.",
                           durationSeconds: 20,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Serve",
                           description: "Serve.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .doubleFilter, .flowControl],
            author: "Némo Pop",
            brewMethod: .upright,
            grindDescription: "Comandante Trailmaster x25, 31 clicks, sifted at 200µm",
            filterNotes: "Flow Control Filter Cap, 2x Paper Filters",
            bypassWaterGrams: 70,
            bypassWaterTempCelsius: 50,
            tags: [.championship, .upright, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jan Ahrend - 2025 - 2nd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Jan Ahrend - 2025 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 152,
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee to inverted AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour 100 g water in circular motion.",
                           durationSeconds: 60,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Stir",
                           description: "Stir 5 times (NSWE pattern).",
                           durationSeconds: 30,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "At 1:30 flip the AeroPress.",
                           durationSeconds: 0,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press until output reaches 66 g.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: 66),

                RecipeStep(title: "Dilute",
                           description: "Dilute concentrate to final beverage weight of 152 g.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 152)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Jan Ahrend",
            brewMethod: .inverted,
            grindDescription: "Comandante C40 Mk4, 24 clicks",
            filterNotes: "2x standard paper filters, rinsed",
            bypassWaterGrams: 86, // 152g final - 66g concentrate
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Dharun Vyas - 2025 - 3rd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Dharun Vyas - 2025 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 16,
            waterAmountGrams: 220, // 208ml brew + 12ml bypass
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 16 g coffee to inverted AeroPress.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour 65 ml water in spirals.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 65,
                           pourAmountGrams: 65),

                RecipeStep(title: "Second pour",
                           description: "Pour 143 ml of water.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 208,
                           pourAmountGrams: 143),

                RecipeStep(title: "Wait",
                           description: "Wait 10 seconds and apply the filter cap.",
                           durationSeconds: 10,
                           action: .steep),

                RecipeStep(title: "Flip",
                           description: "Squeeze out all the extra air and revert the breweron the cup",
                           durationSeconds: 10,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir",
                           description: "4-5 aggressive swirls, wait 10 sec for the grounds to settle over the filter cap end.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Plunge consistently over 1:00.",
                           durationSeconds: 60,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add bypass",
                           description: "Add 12 ml room temperature water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 220)
            ],
            accessories: [.paperFilter],
            author: "Dharun Vyas",
            brewMethod: .inverted,
            grindDescription: "Comandante C40 Red Clix, 52 clicks",
            filterNotes: "1x Classic Filter with Flow Control cap",
            bypassWaterGrams: 12,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

                // MARK: - George Stanica - 2024 - 1st Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "George Stanica - 2024 - 1st Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 100, // extraction water is specified as two 50g pours; dilution water is described as ranges (see steps)
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(title: "Prep AeroPress",
                           description: "Prepare the AeroPress in inverted position around the 4th mark. Add 18 g coffee grounds to the chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Pour approximately 50 g of water using a melodrip (takes about 5–6 seconds).",
                           durationSeconds: 5,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Bloom",
                           description: "Let the coffee bloom for about 30 seconds.",
                           durationSeconds: 30,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Pour another 50 g of water (another 5–6 seconds).",
                           durationSeconds: 5,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 50),

                RecipeStep(title: "Stir",
                           description: "Give the mixture a light stir in a North-South-East-West (NSEW) motion for 10 seconds.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Wait",
                           description: "Wait 30 seconds.",
                           durationSeconds: 30,
                           action: .steep),

                RecipeStep(title: "Cap & expel air",
                           description: "Place the cap with the filter on the AeroPress and start gently removing air.",
                           durationSeconds: 15,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Swirl & press",
                           description: "Gently swirl the AeroPress and place it on your server. Start pressing.",
                           durationSeconds: 40,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Add warm water until you reach a total of 130–135 g. Add another 20–30 g of room temperature 0 ppm water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .melodrip],
            author: "George Stanica",
            brewMethod: .inverted,
            grindDescription: "Comandante C40 Mk4 w/ Red Clix, 58 clicks (870 µm)",
            filterNotes: "1x Aesir, rinsed",
            bypassWaterGrams: nil, // dilution is described as ranges; kept in steps instead of a single value
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Sophan Nugraha - 2024 - 2nd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Sophan Nugraha - 2024 - 2nd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 200, // 60ml room temp + to 190ml hot + 10ml dilution
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Put 18 g of coffee into the chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom pour",
                           description: "Pour 60 ml of room temperature water for blooming into the chamber. Start timing when the pour starts.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 60,
                           pourAmountGrams: 60),

                RecipeStep(title: "Stir & wait",
                           description: "Stir 8 times and wait.",
                           durationSeconds: 30,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second pour",
                           description: "Pour 95°C water until 190 ml total for the second pour.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 190,
                           pourAmountGrams: 130),

                RecipeStep(title: "Flip & press",
                           description: "Start pressing.",
                           durationSeconds: 65,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute",
                           description: "Dilute with 10 ml of room temperature water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 200)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Sophan Nugraha",
            brewMethod: .inverted,
            grindDescription: "Comandante C40 nitro blade, 22 clicks",
            filterNotes: "2x Cafec light roast paper filters (modified to fit AeroPress), rinsed",
            bypassWaterGrams: 10,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        ),

        // MARK: - Jamika (Mahmoud) Jamika - 2024 - 3rd Place
        // https://worldaeropresschampionship.com/pages/recipes
        Recipe(
            name: "Jamika (Mahmoud) Jamika - 2024 - 3rd Place",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 180, // 50ml hot + 100ml hot + 30ml room temp
            waterTemperatureCelsius: 80, // first hot addition is 80°C; second is 75°C (see steps)
            steps: [
                RecipeStep(title: "Prep coffee",
                           description: "Grind 18 grams of coffee and place the ground coffee into the AeroPress (inverted position). Place two filgers inside the cap.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First addition",
                           description: "Add 50 ml of hot water at 80°C to the coffee in the AeroPress.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Stir",
                           description: "Stir gently in a circular motion 5 times to ensure even saturation of the grounds.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom",
                           description: "Let the coffee bloom.",
                           durationSeconds: 45,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Prep filters",
                           description: "Rinse and moisten the filters with hot water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Second addition",
                           description: "Add 100 ml of hot water at 75°C to the AeroPress. Secure the AeroPress cap firmly.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 100),

                RecipeStep(title: "Release air & stir",
                           description: "Gently release half of the air inside the AeroPress. Stir carefully in a circular motion 20 times.",
                           durationSeconds: 30,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Carefully flip the AeroPress.",
                           durationSeconds: 0,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Slowly press the plunger to filter the coffee over 30 seconds.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add room temperature water",
                           description: "Add 30 ml of cold water at room temperature to balance and adjust the flavor.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 180,
                           pourAmountGrams: 30)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Jamika (Mahmoud) Jamika",
            brewMethod: .inverted,
            grindDescription: "Comandante MK4, 900 microns",
            filterNotes: "2 paper filters, rinsed; Water: 50ml at 80°C / 100ml at 75°C / 30ml room temperature",
            bypassWaterGrams: 30,
            bypassWaterTempCelsius: nil,
            tags: [.championship, .inverted, .bypass],
            sourceURL: "https://worldaeropresschampionship.com/pages/recipes"
        )
    ]
}