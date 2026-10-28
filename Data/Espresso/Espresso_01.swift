import Foundation

extension RecipeData {

    /// Espresso-style AeroPress recipes (Batch 01)
    static let espressoBatch01: [Recipe] = [

        // MARK: - Alan Adler Inventor’s Original
        Recipe(
            name: "Alan Adler Inventor’s Original",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 16,
            waterAmountGrams: 70,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 16 g of finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour hot water up to the 1 mark (~60 g).",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 70,
                           pourAmountGrams: 70),

                RecipeStep(title: "Stir",
                           description: "Stir for 10 seconds.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Press gently, stopping at resistance.",
                           durationSeconds: 0,
                           action: .press),
            ],
            author: "Alan Adler",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/alan-adler-espresso-aeropress-recipe"
        ),

        // MARK: - James Hoffmann Espresso-style
        Recipe(
            name: "James Hoffmann Espresso-style",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 18,
            waterAmountGrams: 90,
            waterTemperatureCelsius: 99,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Rinse paper filter thoroughly.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 18 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 90 g of hot water over the grounds.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 90,
                           pourAmountGrams: 90),

                RecipeStep(title: "Stir",
                           description: "Stir 'a little bit aggressively' to fully extract.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Fasten the filter cap and let sit.",
                           durationSeconds: 90,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Flip the AeroPress and press gently into a cup. Keep pressing all the way through the hissing.",
                           durationSeconds: 25,
                           action: .press),
            ],
            accessories: [.paperFilter],
            author: "James Hoffmann",
            brewMethod: .upright,
            grindDescription: "Very fine",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/james-hoffmann-espresso-aeropress-recipe"
        ),

        // MARK: - Tim Wendelboe Espresso-style
        Recipe(
            name: "Tim Wendelboe Espresso-style",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 20,
            waterAmountGrams: 125,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Prep brewer",
                           description: "Rinse paper filter with hot water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 20 g fine coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 125 g of water (straight off the boil) over the grounds.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 125,
                           pourAmountGrams: 125),

                RecipeStep(title: "Stir",
                           description: "Stir vigorously 3 times.",
                           durationSeconds: 0,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Insert the plunger and press into the cup.",
                           durationSeconds: 0,
                           action: .press),
            ],
            accessories: [.paperFilter],
            author: "Tim Wendelboe",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/tim-wendelboe-espresso-aeropress-recipe"
        ),

        // MARK: - Fellow Products Prismo
        Recipe(
            name: "Fellow Products Prismo",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 20,
            waterAmountGrams: 50,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 20 g fine coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 50g of water.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 50,
                           pourAmountGrams: 50),

                RecipeStep(title: "Stir",
                           description: "Stir vigorously.",
                           durationSeconds: 20,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert the plunger. Let steep.",
                           durationSeconds: 40,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press hard and all the way down.",
                           durationSeconds: 0,
                           action: .press),
            ],
            accessories: [.flowControl],
            author: "Fellow Products",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/fellow-products-espresso-prismo-aeropress-recipe"
        ),

        // MARK: - Alternative Brewing Prismo
        Recipe(
            name: "Alternative Brewing Prismo",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 18,
            waterAmountGrams: 55,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Set plunger",
                        description: "Using the inverted method, bring the plunger in line with level 2 on the chamber.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Prepare Prismo",
                        description: "Place the metal filter in the Prismo cap so that it's ready to screw on.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Add coffee",
                        description: "Add 18 g of ground coffee to the brew chamber.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Pour water",
                        description: "Pour 55 g of hot water over the grounds.",
                        durationSeconds: 10,
                        action: .pour,
                        targetWaterWeight: 55,
                        pourAmountGrams: 55),

                RecipeStep(title: "Stir",
                        description: "Stir vigorously to agitate the grounds.",
                        durationSeconds: 10,
                        action: .stir),

                RecipeStep(title: "Remove air",
                        description: "Press down slightly on the chamber to remove excess air.",
                        durationSeconds: 5,
                        action: .prep),

                RecipeStep(title: "Attach cap",
                        description: "Screw the Prismo cap on tightly and let steep.",
                        durationSeconds: 45,
                        action: .steep),

                RecipeStep(title: "Flip & press",
                        description: "Flip the AeroPress and press gently into a cup through the hissing.",
                        durationSeconds: 20,
                        action: .press),
            ],
            accessories: [.flowControl, .metalFilter],
            author: "Alternative Brewing",
            brewMethod: .upright,
            grindDescription: "Fine",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/alternative-brewing-espresso-prismo-aeropress-recipe"
        ),

        // MARK: - Joseph Robertson 
        Recipe(
            name: "Joseph Robertson",
            equipment: .original,
            cupTypes: [.espressoEsque],
            coffeeAmountGrams: 20,
            waterAmountGrams: 60,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Prep filter",
                        description: "Place a paper filter in the cap and rinse with hot water.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Add coffee",
                        description: "Add 20 g of ground coffee. It should be ground finer than drip but not quite espresso.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Level grounds",
                        description: "Give a gentle shake to level the grounds.",
                        durationSeconds: 0,
                        action: .prep),

                RecipeStep(title: "Pour water",
                        description: "Pour 60 g of hot water over the grounds.",
                        durationSeconds: 0,
                        action: .pour,
                        targetWaterWeight: 60,
                        pourAmountGrams: 60),

                RecipeStep(title: "Stir",
                        description: "Stir a few times to saturate all the grounds.",
                        durationSeconds: 0,
                        action: .stir),

                RecipeStep(title: "Press",
                        description: "Immediately press into the cup using as much pressure as possible.",
                        durationSeconds: 0,
                        action: .press),
            ],
            accessories: [.paperFilter],
            author: "Joseph Robertson",
            brewMethod: .upright,
            grindDescription: "Fine (finer than drip, not full espresso)",
            tags: [.concentrate],
            sourceURL: "https://aeromatic.app/recipes/joseph-robertson-espresso-metal-filter-aeropress-recipe"
        )
    ]
}