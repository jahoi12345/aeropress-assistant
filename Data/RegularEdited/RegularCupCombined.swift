import Foundation

extension RecipeData {

    /// Regular-cup recipes (Batch 01)
    /// Sources are the provided Aeromatic recipe URLs.
    static let regularCupBatch01: [Recipe] = [

        // MARK: - Alan Adler Regular Cup
        // https://aeromatic.app/recipes/alan-adler-aeropress-recipe
        Recipe(
            name: "Alan Adler Regular Cup",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 16,
            waterAmountGrams: 95,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 16 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Level grounds",
                           description: "Give a gentle shake to level the grounds.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Pour water up to about 1½ on the chamber (approximately 95 g).",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 95,
                           pourAmountGrams: 95),

                RecipeStep(title: "Stir",
                           description: "Stir using the paddle.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Insert the plunger and press gently, pausing when you meet resistance. Stop once the plunger reaches the grounds.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute to taste",
                           description: "Add additional hot water to the cup, to taste.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter], // no filter explicitly mentioned
            author: "Alan Adler",
            brewMethod: .upright,
            grindDescription: "Fine Grind",
            filterNotes: nil,
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.upright],
            sourceURL: "https://aeromatic.app/recipes/alan-adler-aeropress-recipe"
        ),

        // MARK: - Alternative Brewing 2-Cup XL
        // https://aeromatic.app/recipes/alternative-brewing-2-cup-xl-aeropress-recipe
        Recipe(
            name: "Alternative Brewing 2-Cup XL",
            equipment: .xl,
            cupTypes: [.regular],
            coffeeAmountGrams: 40,
            waterAmountGrams: 550,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Prep filters",
                           description: "Place two paper filters in the cap and rinse with hot water. Discard the rinse water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 40 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Quickly pour 550 g of hot water into the brew chamber.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 550,
                           pourAmountGrams: 550),

                RecipeStep(title: "Stir",
                           description: "Stir gently.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Fasten the filter cap and let sit.",
                           durationSeconds: 85,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press slowly into the cup.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Alternative Brewing",
            brewMethod: .upright,
            grindDescription: "Coarse Grind",
            filterNotes: "Two paper filters (rinsed)",
            tags: [.upright],
            sourceURL: "https://aeromatic.app/recipes/alternative-brewing-2-cup-xl-aeropress-recipe"
        ),

        // MARK: - Alternative Brewing 4-Cup XL
        // https://aeromatic.app/recipes/alternative-brewing-4-cup-xl-aeropress-recipe
        Recipe(
            name: "Alternative Brewing 4-Cup XL",
            equipment: .xl,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 80,
            waterAmountGrams: 550,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Prep filters",
                           description: "Place two paper filters in the cap and rinse with hot water. Discard the rinse water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 80 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour water",
                           description: "Quickly pour 550 g of hot water into the brew chamber.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 550,
                           pourAmountGrams: 550),

                RecipeStep(title: "Stir",
                           description: "Stir gently.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Steep",
                           description: "Fasten the filter cap and let sit.",
                           durationSeconds: 85,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press slowly into the cup.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Dilute to taste",
                           description: "Separate the brew evenly into 4 to 6 cups. Top up each cup with hot water to taste.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Alternative Brewing",
            brewMethod: .upright,
            grindDescription: "Coarse Grind",
            filterNotes: "Two paper filters (rinsed)",
            tags: [.upright, .bypass],
            sourceURL: "https://aeromatic.app/recipes/alternative-brewing-4-cup-xl-aeropress-recipe"
        ),

        // MARK: - Blue Bottle
        // https://aeromatic.app/recipes/blue-bottle-aeropress-recipe
        Recipe(
            name: "Blue Bottle",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 15,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 93,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place a paper filter in the cap and rinse with hot water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g of ground coffee to the brew chamber. It should be ground slightly finer than sea salt.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom pour",
                           description: "Pour 30 g of hot water over the grounds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 30,
                           pourAmountGrams: 30),

                RecipeStep(title: "Tamp & bloom",
                           description: "Tamp the grounds and let bloom.",
                           durationSeconds: 20,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Main pour & steep",
                           description: "Pour an additional 170 g of hot water.",
                           durationSeconds: 60,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 170),

                RecipeStep(title: "Stir",
                           description: "Stir 10 times.",
                           durationSeconds: 0,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Fasten cap",
                           description: "Fasten the filter cap.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Flip onto cup.",
                           durationSeconds: 0,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press into a cup.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Blue Bottle",
            brewMethod: .inverted,
            grindDescription: "Medium Grind",
            filterNotes: "Paper filter (rinsed)",
            tags: [.inverted],
            sourceURL: "https://aeromatic.app/recipes/blue-bottle-aeropress-recipe"
        ),

        // MARK: - Bould Brothers
        // https://aeromatic.app/recipes/bould-brothers-aeropress-recipe
        Recipe(
            name: "Bould Brothers",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 30,
            waterAmountGrams: 260,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place a paper filter in the cap and rinse with hot water.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Add coffee",
                           description: "Add 30 g of ground coffee to the brew chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Pour brew water",
                           description: "Pour 150 g of hot water over the grounds.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 150,
                           pourAmountGrams: 150),

                RecipeStep(title: "Stir",
                           description: "Stir 20 times.",
                           durationSeconds: 15,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Attach cap & steep",
                           description: "Fasten the filter cap and push out excess air. Let steep.",
                           durationSeconds: 30,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip",
                           description: "Flip the AeroPress onto the cup.",
                           durationSeconds: 0,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Press into a cup.",
                           durationSeconds: 30,
                           action: .press,
                           targetWaterWeight: nil),

                RecipeStep(title: "Top up",
                           description: "Top up the brew with 110 g of hot water.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: 260)
            ],
            accessories: [.paperFilter],
            author: "Bould Brothers",
            brewMethod: .inverted,
            grindDescription: "Medium Grind",
            filterNotes: "Paper filter (rinsed)",
            bypassWaterGrams: 110,
            tags: [.inverted, .bypass],
            sourceURL: "https://aeromatic.app/recipes/bould-brothers-aeropress-recipe"
        )
    ]

    /// Regular-cup recipes (Batch 02)
    /// Rewritten strictly from provided specifications.
    static let regularCupBatch02: [Recipe] = [

        // MARK: - Chris Baca
        Recipe(
            name: "Chris Baca",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 16,
            waterAmountGrams: 272,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(
                    title: "Preheat brewer",
                    description: "Add hot water to the brew chamber, swirl, pour through filter and cap into cup, and discard rinse water.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Add coffee",
                    description: "Add 16 g of coffee, ground slightly finer than standard drip.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Pour water",
                    description: "Add 272 g of hot water aggressively to fully saturate grounds. Spin chamber if needed.",
                    durationSeconds: 20,
                    action: .pour,
                    targetWaterWeight: 272,
                    pourAmountGrams: 272
                ),
                RecipeStep(
                    title: "Stir",
                    description: "Stir immediately, reaching the bottom to break clumps.",
                    durationSeconds: 10,
                    action: .stir
                ),
                RecipeStep(
                    title: "Attach cap",
                    description: "Fasten the filter cap and let sit.",
                    durationSeconds: 105,
                    action: .prep
                ),
                RecipeStep(
                    title: "Flip & press",
                    description: "Flip and press into cup. Stop at hissing sound (15–30 seconds).",
                    durationSeconds: 15, // minimum of stated range
                    action: .press
                )
            ],
            accessories: [.paperFilter],
            author: "Chris Baca",
            brewMethod: .inverted,
            grindDescription: "Medium (slightly finer than standard drip)",
            filterNotes: nil,
            tags: [.inverted],
            sourceURL: nil
        ),

        // MARK: - Coffee with April
        Recipe(
            name: "Coffee with April",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 13,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(
                    title: "Add coffee",
                    description: "Add 13 g of coarse-ground coffee.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Bloom pour",
                    description: "Pour 50 g of hot water quickly in circular motion.",
                    durationSeconds: 10,
                    action: .pour,
                    targetWaterWeight: 50,
                    pourAmountGrams: 50
                ),
                RecipeStep(
                    title: "Stir & seal",
                    description: "Stir, insert plunger slightly to create seal, and let steep.",
                    durationSeconds: 20,
                    action: .stir
                ),
                RecipeStep(
                    title: "Second pour",
                    description: "Remove plunger and add 150 g hot water quickly.",
                    durationSeconds: 10,
                    action: .pour,
                    targetWaterWeight: 200,
                    pourAmountGrams: 150
                ),
                RecipeStep(
                    title: "Reinsert plunger",
                    description: "Reinsert plunger and let sit.",
                    durationSeconds: 50,
                    action: .prep
                ),
                RecipeStep(
                    title: "Press",
                    description: "Slowly press into cup. Stop at hissing sound.",
                    durationSeconds: 30,
                    action: .press
                )
            ],
            accessories: nil,
            author: "Coffee with April",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: nil,
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Coffee with Carl
        Recipe(
            name: "Coffee with Carl",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 14,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 88,
            steps: [
                RecipeStep(
                    title: "Prep filters",
                    description: "Place two paper filters in cap and rinse.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Add coffee",
                    description: "Add 14 g of coarse-ground coffee and shake to level.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Pour water",
                    description: "Pour 200 g hot water in fast circular motion.",
                    durationSeconds: 10,
                    action: .pour,
                    targetWaterWeight: 200,
                    pourAmountGrams: 200
                ),
                RecipeStep(
                    title: "Stir",
                    description: "Stir vigorously with chopsticks.",
                    durationSeconds: 10,
                    action: .stir
                ),
                RecipeStep(
                    title: "Attach cap & steep",
                    description: "Fasten cap and let sit.",
                    durationSeconds: 90,
                    action: .steep
                ),
                RecipeStep(
                    title: "Flip & press",
                    description: "Flip and press very slowly into cup.",
                    durationSeconds: 60,
                    action: .press
                )
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Coffee with Carl",
            brewMethod: .inverted,
            grindDescription: "Coarse",
            filterNotes: "Two paper filters",
            tags: [.inverted],
            sourceURL: nil
        ),

        // MARK: - CoffeeGeek
        Recipe(
            name: "CoffeeGeek",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 21,
            waterAmountGrams: 245,
            waterTemperatureCelsius: 98,
            steps: [
                RecipeStep(title: "Add coffee", description: "Add 21 g coarse-ground coffee.", durationSeconds: 0, action: .prep),
                RecipeStep(title: "First pour", description: "Pour 100 g hot water.", durationSeconds: 10, action: .pour, targetWaterWeight: 100, pourAmountGrams: 100),
                RecipeStep(title: "Bloom", description: "Let bloom.", durationSeconds: 5, action: .steep),
                RecipeStep(title: "Stir", description: "Stir to saturate grounds.", durationSeconds: 10, action: .stir),
                RecipeStep(title: "Second pour", description: "Add 100 g hot water.", durationSeconds: 15, action: .pour, targetWaterWeight: 200, pourAmountGrams: 100),
                RecipeStep(title: "Stir again", description: "Stir 2 more times.", durationSeconds: 10, action: .stir),
                RecipeStep(title: "Final top-up", description: "Add ~45 g hot water to reach ~245 g.", durationSeconds: 5, action: .pour, targetWaterWeight: 245, pourAmountGrams: 45),
                RecipeStep(title: "Attach cap", description: "Fasten metal filter and place cup on top.", durationSeconds: 15, action: .prep),
                RecipeStep(title: "Flip", description: "Flip and wait briefly.", durationSeconds: 10, action: .flip),
                RecipeStep(title: "Press", description: "Press slowly until hissing sound.", durationSeconds: 15, action: .press)
            ],
            accessories: [.metalFilter],
            author: "CoffeeGeek",
            brewMethod: .inverted,
            grindDescription: "Coarse",
            filterNotes: "Metal filter",
            tags: [.inverted],
            sourceURL: nil
        ),

        // MARK: - Counter Culture
        Recipe(
            name: "Counter Culture",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(title: "Add coffee", description: "Add 18 g finely ground coffee.", durationSeconds: 0, action: .prep),
                RecipeStep(title: "Level grounds", description: "Shake gently to level.", durationSeconds: 0, action: .prep),
                RecipeStep(title: "First pour", description: "Pour 100 g hot water.", durationSeconds: 30, action: .pour, targetWaterWeight: 100, pourAmountGrams: 100),
                RecipeStep(title: "Stir", description: "Stir to saturate grounds.", durationSeconds: 15, action: .stir),
                RecipeStep(title: "Second pour", description: "Add additional 100 g water.", durationSeconds: 60, action: .pour, targetWaterWeight: 200, pourAmountGrams: 100),
                RecipeStep(title: "Final stir", description: "Stir a few more times.", durationSeconds: 15, action: .stir),
                RecipeStep(title: "Attach cap", description: "Fasten cap and let sit.", durationSeconds: 0, action: .prep),
                RecipeStep(title: "Flip & press", description: "Flip and press until hissing sound.", durationSeconds: 30, action: .press)
            ],
            accessories: nil,
            author: "Counter Culture",
            brewMethod: .inverted,
            grindDescription: "Fine",
            filterNotes: nil,
            tags: [.inverted],
            sourceURL: nil
        )
    ]

    /// Regular-cup recipes (Batch 03)
    static let regularCupBatch03: [Recipe] = [

        // MARK: - Heart
        Recipe(
            name: "Heart",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 270,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse with hot water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 18 g ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Quickly pour 270 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 270,
                           pourAmountGrams: 270),

                RecipeStep(title: "Stir & seal",
                           description: "Stir and insert plunger slightly to create seal.",
                           durationSeconds: 40,
                           action: .stir),

                RecipeStep(title: "Stir",
                           description: "Remove plunger and stir briefly.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Reinsert plunger and let sit.",
                           durationSeconds: 50,
                           action: .steep),

                RecipeStep(title: "Stir again",
                           description: "Remove plunger and stir briefly.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Reinsert plunger and press slowly until hissing.",
                           durationSeconds: 20,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Heart",
            brewMethod: .upright,
            grindDescription: "Medium (slightly finer than standard drip)",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Intelligentsia
        Recipe(
            name: "Intelligentsia",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 16,
            waterAmountGrams: 250,
            waterTemperatureCelsius: 97,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 16 g coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Bloom pour",
                           description: "Pour 35 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 35,
                           pourAmountGrams: 35),

                RecipeStep(title: "Stir",
                           description: "Stir immediately to saturate grounds.",
                           durationSeconds: 50,
                           action: .stir),

                RecipeStep(title: "Main pour",
                           description: "Add remaining 215 g water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 215),

                RecipeStep(title: "Stir again",
                           description: "Stir back and forth.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 180,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press slowly for at least 30 seconds.",
                           durationSeconds: 30,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Intelligentsia",
            brewMethod: .upright,
            grindDescription: "Medium",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - James Hoffmann
        Recipe(
            name: "James Hoffmann",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 11,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Attach filter",
                           description: "Place paper filter in cap and attach (no rinse).",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 11 g ground coffee (grind adjusted by roast level).",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 200 g hot water.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 200),

                RecipeStep(title: "Seal",
                           description: "Insert plunger slightly to create seal.",
                           durationSeconds: 100,
                           action: .prep),

                RecipeStep(title: "Swirl",
                           description: "Gently swirl.",
                           durationSeconds: 15,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Let sit briefly longer.",
                           durationSeconds: 15,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press gently through hissing.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "James Hoffmann",
            brewMethod: .upright,
            grindDescription: "Medium (adjusted by roast level)",
            filterNotes: "Paper filter (not rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Jonathan Gagné Prismo
        Recipe(
            name: "Jonathan Gagné Prismo",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 260,
            waterTemperatureCelsius: 99,
            steps: [
                RecipeStep(title: "Attach Prismo",
                           description: "Place paper filter on top of Prismo metal filter and attach.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "First pour",
                           description: "Add 130 g hot water to brew chamber.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 130,
                           pourAmountGrams: 130),

                RecipeStep(title: "Add coffee",
                           description: "Stir 18 g ground coffee into water.",
                           durationSeconds: 0,
                           action: .stir),

                RecipeStep(title: "Second pour",
                           description: "Add remaining 130 g water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 260,
                           pourAmountGrams: 130),

                RecipeStep(title: "Stir",
                           description: "Stir thoroughly bottom to top.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Swirl",
                           description: "Insert plunger and swirl.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Let steep.",
                           durationSeconds: 270,
                           action: .steep),

                RecipeStep(title: "Swirl Two",
                           description: "Another swirl.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Let steep.",
                           durationSeconds: 230,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Press slowly into cup.",
                           durationSeconds: 60,
                           action: .press)
            ],
            accessories: [.flowControl, .metalFilter, .paperFilter],
            author: "Jonathan Gagné",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter on top of Prismo metal filter",
            tags: [.upright],
            sourceURL: nil
        )
    ]

    /// Regular-cup recipes (Batch 04)
    static let regularCupBatch04: [Recipe] = [

        // MARK: - Joshua Rey Prismo
        Recipe(
            name: "Joshua Rey Prismo",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 23,
            waterAmountGrams: 300,
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(
                    title: "Attach Prismo",
                    description: "Place a paper filter on top of the Prismo metal filter and attach.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Add coffee",
                    description: "Add 23 g coarse-ground coffee.",
                    durationSeconds: 0,
                    action: .prep
                ),
                RecipeStep(
                    title: "Bloom pour",
                    description: "Pour 50 g hot water, swirl, and let bloom.",
                    durationSeconds: 30,
                    action: .pour,
                    targetWaterWeight: 50,
                    pourAmountGrams: 50
                ),
                RecipeStep(
                    title: "Main pour",
                    description: "Pour additional 225 g hot water.",
                    durationSeconds: 15,
                    action: .pour,
                    targetWaterWeight: 275,
                    pourAmountGrams: 225
                ),
                RecipeStep(
                    title: "Ensure saturation",
                    description: "Stir to ensure all coffee is in contact with water, then let sit.",
                    durationSeconds: 105,
                    action: .stir
                ),
                RecipeStep(
                    title: "Press",
                    description: "Insert plunger and press into cup.",
                    durationSeconds: 30,
                    action: .press
                ),
                RecipeStep(
                    title: "Bypass",
                    description: "Add 25 g hot water to extracted coffee and stir.",
                    durationSeconds: 0,
                    action: .serve
                )
            ],
            accessories: [.flowControl, .metalFilter, .paperFilter],
            author: "Joshua Rey",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: "Paper filter on top of Prismo metal filter",
            bypassWaterGrams: 25,
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Kyle Rowsell
        Recipe(
            name: "Kyle Rowsell",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 18,
            waterAmountGrams: 225,
            waterTemperatureCelsius: 99,
            steps: [
                RecipeStep(title: "Attach filters",
                           description: "Place two paper filters in cap. Do not rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 18 g fine-ground coffee and shake to level.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "First pour",
                           description: "Quickly pour 60 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 60,
                           pourAmountGrams: 60),

                RecipeStep(title: "Stir",
                           description: "Stir back and forth 10 times.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Second pour",
                           description: "Pour additional 165 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 225,
                           pourAmountGrams: 165),

                RecipeStep(title: "Stir thoroughly",
                           description: "Stir slowly bottom to top.",
                           durationSeconds: 15,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger and let steep.",
                           durationSeconds: 120,
                           action: .steep),

                RecipeStep(title: "Stir again",
                           description: "Remove plunger and stir again bottom to top.",
                           durationSeconds: 15,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Press gently through hiss.",
                           durationSeconds: 45,
                           action: .press),

                RecipeStep(title: "Aerate",
                           description: "Pour between two carafes and swirl to aerate and cool.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Kyle Rowsell",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Two paper filters (not rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Lance Hedrick Dark Roast
        Recipe(
            name: "Lance Hedrick Dark Roast",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 30,
            waterAmountGrams: 120,
            waterTemperatureCelsius: 80,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "If using paper filter, wet it.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 30 g extra-coarse coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 120 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 120,
                           pourAmountGrams: 120),

                RecipeStep(title: "Stir",
                           description: "Stir vigorously.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Push plunger slightly to remove air gap and let sit.",
                           durationSeconds: 40,
                           action: .steep),

                RecipeStep(title: "Flip & press",
                           description: "Attach cap, flip, and press until hissing.",
                           durationSeconds: 60,
                           action: .press),

                RecipeStep(title: "Bypass",
                           description: "Add 80 g hot water to taste.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: nil,
            author: "Lance Hedrick",
            brewMethod: .inverted,
            grindDescription: "Extra Coarse",
            filterNotes: "Paper, Prismo, or Flow Control compatible",
            bypassWaterGrams: 80,
            roastLevel: .dark,
            tags: [.inverted, .bypass],
            sourceURL: nil
        ),

        // MARK: - Lance Hedrick Light Roast
        Recipe(
            name: "Lance Hedrick Light Roast",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 20,
            waterAmountGrams: 120,
            waterTemperatureCelsius: 85,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "If using paper filter, wet it.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 20 g coarse coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 120 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 120,
                           pourAmountGrams: 120),

                RecipeStep(title: "Stir",
                           description: "Stir vigorously.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Push plunger slightly to remove air gap and let sit.",
                           durationSeconds: 35,
                           action: .steep),

                RecipeStep(title: "Attach & swirl",
                           description: "Fasten cap, place cup on top, and swirl.",
                           durationSeconds: 5,
                           action: .prep),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press until hissing.",
                           durationSeconds: 60,
                           action: .press),

                RecipeStep(title: "Bypass",
                           description: "Add 60 g hot water to taste.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: nil,
            author: "Lance Hedrick",
            brewMethod: .inverted,
            grindDescription: "Coarse",
            filterNotes: "Paper, Prismo, or Flow Control compatible",
            bypassWaterGrams: 60,
            roastLevel: .light,
            tags: [.inverted, .bypass],
            sourceURL: nil
        ),

        // MARK: - Michael Fabian Prismo
        Recipe(
            name: "Michael Fabian Prismo",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 15,
            waterAmountGrams: 210,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Attach Prismo",
                           description: "Place paper filter on top of Prismo metal filter. Do not rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g fine-ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 210 g hot water quickly in circular motion.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 210,
                           pourAmountGrams: 210),

                RecipeStep(title: "Steep",
                           description: "Let steep.",
                           durationSeconds: 100,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Insert plunger and press into cup.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.flowControl, .metalFilter, .paperFilter],
            author: "Michael Fabian",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter on top of Prismo metal filter (not rinsed)",
            tags: [.upright],
            sourceURL: nil
        )
    ]

    /// Regular-cup recipes (Batch 05)
    static let regularCupBatch05: [Recipe] = [

        // MARK: - Onyx
        Recipe(
            name: "Onyx",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 15,
            waterAmountGrams: 250,
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse with hot water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Bloom pour",
                           description: "Pour 60 g hot water while twisting AeroPress to saturate grounds.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 60,
                           pourAmountGrams: 60),

                RecipeStep(title: "Stir",
                           description: "Give a quick stir and let bloom.",
                           durationSeconds: 20,
                           action: .stir),

                RecipeStep(title: "Main pour",
                           description: "Slowly add remaining 190 g hot water while spinning.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 190),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 45,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Slowly press fully into cup.",
                           durationSeconds: 30,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Onyx",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Passenger Coffee
        Recipe(
            name: "Passenger Coffee",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 20,
            waterAmountGrams: 300,
            waterTemperatureCelsius: 99,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Insert paper filter, attach, rinse, discard rinse water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 20 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Main pour",
                           description: "Add 200 g hot water while spinning brewer.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 200),

                RecipeStep(title: "Stir",
                           description: "Stir 3 times.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 30,
                           action: .steep),

                RecipeStep(title: "Stir again",
                           description: "Remove plunger and stir 3 more times.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Reinsert plunger and press gently through hiss.",
                           durationSeconds: 20,
                           action: .press),

                RecipeStep(title: "Bypass",
                           description: "Top up with additional 100 g hot water.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "Passenger Coffee",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter (rinsed)",
            bypassWaterGrams: 100,
            tags: [.upright, .bypass],
            sourceURL: nil
        ),

        // MARK: - Ritual
        Recipe(
            name: "Ritual",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 16,
            waterAmountGrams: 225,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Insert paper filter, attach, rinse, discard rinse water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 16 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Slowly pour 225 g hot water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 225,
                           pourAmountGrams: 225),

                RecipeStep(title: "Stir",
                           description: "Stir slowly front to back and left to right.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 35,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Slowly press into cup.",
                           durationSeconds: 25,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Ritual",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Sightglass
        Recipe(
            name: "Sightglass",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 220,
            waterTemperatureCelsius: 97,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 17 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Level grounds",
                           description: "Shake gently to level grounds.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 220 g hot water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 220,
                           pourAmountGrams: 220),

                RecipeStep(title: "Stir",
                           description: "Give a quick gentle stir.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 25,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Slowly press into cup until hissing.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Sightglass",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Stumptown
        Recipe(
            name: "Stumptown",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 17,
            waterAmountGrams: 220,
            waterTemperatureCelsius: 96,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Insert paper filter, attach, rinse, discard rinse water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 17 g finely ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 220 g hot water, saturating grounds within first 10 seconds.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 220,
                           pourAmountGrams: 220),

                RecipeStep(title: "Stir",
                           description: "Stir and insert plunger slightly to create seal.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Let steep.",
                           durationSeconds: 45,
                           action: .steep),

                RecipeStep(title: "Stir again",
                           description: "Remove plunger and stir again.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Reinsert plunger and press slowly until hissing.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Stumptown",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        )
    ]

    /// Regular-cup recipes (Batch 06)
    static let regularCupBatch06: [Recipe] = [

        // MARK: - The Coffee Compass
        Recipe(
            name: "The Coffee Compass",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 15,
            waterAmountGrams: 225,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Prep filters",
                           description: "Place two paper filters in cap and rinse. Discard rinse water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g medium-ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Main pour",
                           description: "Briskly pour 225 g boiling water.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 225,
                           pourAmountGrams: 225),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 40,
                           action: .steep),

                RecipeStep(title: "Break crust",
                           description: "Remove plunger and gently break crust.",
                           durationSeconds: 10,
                           action: .stir),

                RecipeStep(title: "Rest",
                           description: "Reinsert plunger and let sit.",
                           durationSeconds: 170,
                           action: .steep),

                RecipeStep(title: "Press",
                           description: "Slowly press into cup.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Michael Butterworth",
            brewMethod: .upright,
            grindDescription: "Medium",
            filterNotes: "Two paper filters (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - The Real Sprometheus
        Recipe(
            name: "The Real Sprometheus",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 15,
            waterAmountGrams: 250,
            waterTemperatureCelsius: 90,
            steps: [
                RecipeStep(title: "Attach filter",
                           description: "Place paper filter in cap and attach. Do not rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g finely ground coffee and shake to level.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Bloom pour",
                           description: "Pour 100 g hot water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Bloom",
                           description: "Let bloom.",
                           durationSeconds: 80,
                           action: .steep),

                RecipeStep(title: "Main pour",
                           description: "Add remaining 150 g hot water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 250,
                           pourAmountGrams: 150),

                RecipeStep(title: "Stir",
                           description: "Stir front to back and left to right.",
                           durationSeconds: 15,
                           action: .stir),

                RecipeStep(title: "Steep",
                           description: "Insert plunger slightly to create seal and let steep.",
                           durationSeconds: 30,
                           action: .steep),

                RecipeStep(title: "Swirl & press",
                           description: "Swirl brewer and gently press through hiss.",
                           durationSeconds: 45,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "The Real Sprometheus",
            brewMethod: .upright,
            grindDescription: "Fine",
            filterNotes: "Paper filter (not rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - The Real Sprometheus Pourover
        Recipe(
            name: "The Real Sprometheus Pourover",
            equipment: .original,
            cupTypes: [.pourover],
            coffeeAmountGrams: 15,
            waterAmountGrams: 240,
            waterTemperatureCelsius: 100,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 15 g coarse-ground coffee and shake to level.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 240 g hot water.",
                           durationSeconds: 0,
                           action: .pour,
                           targetWaterWeight: 240,
                           pourAmountGrams: 240),

                RecipeStep(title: "Stir",
                           description: "Give a stir and let drip.",
                           durationSeconds: 0,
                           action: .stir),

                RecipeStep(title: "Swirl",
                           description: "Swirl when water level reaches level 1.",
                           durationSeconds: 0,
                           action: .stir),

                RecipeStep(title: "Finish",
                           description: "Remove brewer once water level hits grounds.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "The Real Sprometheus",
            brewMethod: .upright,
            grindDescription: "Coarse",
            filterNotes: "Paper filter (rinsed)",
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - The Studio Coffee XL Inverted
        Recipe(
            name: "The Studio Coffee XL Inverted",
            equipment: .xl,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 72,
            waterAmountGrams: 740,
            waterTemperatureCelsius: 92,
            steps: [
                RecipeStep(title: "Prep brewer",
                           description: "Rinse filter and preheat chamber. Discard water.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 72 g medium-ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "First pour",
                           description: "Pour 370 g hot water.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 370,
                           pourAmountGrams: 370),

                RecipeStep(title: "Stir",
                           description: "Stir 32.5 times.",
                           durationSeconds: 50,
                           action: .stir),

                RecipeStep(title: "Attach cap",
                           description: "Fasten filter cap and remove excess air.",
                           durationSeconds: 10,
                           action: .prep),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press into cup.",
                           durationSeconds: 60,
                           action: .press),

                RecipeStep(title: "Bypass",
                           description: "Top up with additional 370 g hot water.",
                           durationSeconds: 0,
                           action: .serve)
            ],
            accessories: [.paperFilter],
            author: "The Studio Coffee",
            brewMethod: .inverted,
            grindDescription: "Medium",
            filterNotes: "Paper filter (rinsed)",
            bypassWaterGrams: 370,
            tags: [.inverted, .bypass],
            sourceURL: nil
        ),

        // MARK: - Tim Wendelboe
        Recipe(
            name: "Tim Wendelboe",
            equipment: .original,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 14,
            waterAmountGrams: 200,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Prep filter",
                           description: "Place paper filter in cap and rinse.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 14 g medium-ground coffee.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 200 g hot water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 200),

                RecipeStep(title: "Stir",
                           description: "Stir 3 times.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Seal",
                           description: "Insert plunger slightly to create seal.",
                           durationSeconds: 40,
                           action: .prep),

                RecipeStep(title: "Stir again",
                           description: "Remove plunger and stir 3 times.",
                           durationSeconds: 0,
                           action: .stir),

                RecipeStep(title: "Press",
                           description: "Reinsert plunger and press into cup.",
                           durationSeconds: 0,
                           action: .press)
            ],
            accessories: [.paperFilter],
            author: "Tim Wendelboe",
            brewMethod: .upright,
            grindDescription: "Medium",
            filterNotes: "Paper filter (rinsed)",
            roastLevel: .light,
            tags: [.upright],
            sourceURL: nil
        ),

        // MARK: - Wendelien van Bunnik
        Recipe(
            name: "Wendelien van Bunnik",
            equipment: .original,
            cupTypes: [.regular],
            coffeeAmountGrams: 16,
            waterAmountGrams: 230,
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Prep filters",
                           description: "Place two paper filters in cap, rinse, and remove air bubbles.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Add coffee",
                           description: "Add 16 g coarse-ground coffee and shake to level.",
                           durationSeconds: 0,
                           action: .prep),

                RecipeStep(title: "Pour water",
                           description: "Pour 230 g hot water.",
                           durationSeconds: 15,
                           action: .pour,
                           targetWaterWeight: 230,
                           pourAmountGrams: 230),

                RecipeStep(title: "Stir",
                           description: "Stir gently 5 times.",
                           durationSeconds: 5,
                           action: .stir),

                RecipeStep(title: "Attach cap",
                           description: "Fasten filter cap and let sit.",
                           durationSeconds: 40,
                           action: .prep),

                RecipeStep(title: "Flip & press",
                           description: "Flip and press until hissing.",
                           durationSeconds: 30,
                           action: .press)
            ],
            accessories: [.paperFilter, .doubleFilter],
            author: "Wendelien van Bunnik",
            brewMethod: .inverted,
            grindDescription: "Coarse",
            filterNotes: "Two paper filters (rinsed)",
            tags: [.inverted],
            sourceURL: nil
        ),

                // MARK: - Foundation AeroPress Go
        Recipe(
            name: "Foundation AeroPress Go",
            equipment: .go,
            cupTypes: [.regular],
            coffeeAmountGrams: 15,
            waterAmountGrams: nil, // filled to near brim; exact total not specified
            waterTemperatureCelsius: 94,
            steps: [
                RecipeStep(title: "Rinse filter & preheat",
                           description: "Place paper filter in cap, screw on and pour a small amount of hot water through to rinse and preheat.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Invert & add coffee",
                           description: "Invert AeroPress Go and add 15 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Bloom",
                           description: "Pour ~30 ml water to fully soak grounds and bloom for 30 seconds.",
                           durationSeconds: 30,
                           action: .pour,
                           targetWaterWeight: 30,
                           pourAmountGrams: 30),

                RecipeStep(title: "Main pour",
                           description: "Add remaining water until chamber is almost full.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir",
                           description: "Stir for 10 seconds.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cap & expel air",
                           description: "Attach rinsed filter cap and gently squeeze out trapped air.",
                           durationSeconds: 20,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Flip & press",
                           description: "Flip onto cup and press gently until hissing.",
                           durationSeconds: 0,
                           action: .press,
                           targetWaterWeight: nil)
            ],
            accessories: [.paperFilter],
            author: "Foundation Coffee",
            brewMethod: .inverted,
            grindDescription: "AeroPress grind",
            filterNotes: "Paper filter, rinsed",
            bypassWaterGrams: nil,
            bypassWaterTempCelsius: nil,
            tags: [.inverted],
            sourceURL: nil
        ),

        

        // MARK: - Tommy Yrl - AeroPress Go for 2-3 Cups
        Recipe(
            name: "Tommy Yrl - AeroPress Go for 2-3 Cups",
            equipment: .go,
            cupTypes: [.regular, .bypass],
            coffeeAmountGrams: 18,
            waterAmountGrams: 200, // brew water; dilution 40–60 ml
            waterTemperatureCelsius: 95,
            steps: [
                RecipeStep(title: "Add coffee",
                           description: "Add 18 g coffee.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Prep filters",
                           description: "Pre-wet two paper filters and place in cap. Add coffee to chamber.",
                           durationSeconds: 0,
                           action: .prep,
                           targetWaterWeight: nil),

                RecipeStep(title: "First pour",
                           description: "Start timer and add 100 ml water off the boil. Stir 3 times vigorously.",
                           durationSeconds: 20,
                           action: .pour,
                           targetWaterWeight: 100,
                           pourAmountGrams: 100),

                RecipeStep(title: "Top up",
                           description: "Immediately top up to 200 ml water.",
                           durationSeconds: 10,
                           action: .pour,
                           targetWaterWeight: 200,
                           pourAmountGrams: 100),

                RecipeStep(title: "Steep",
                           description: "Let steep.",
                           durationSeconds: 30,
                           action: .steep,
                           targetWaterWeight: nil),

                RecipeStep(title: "Stir",
                           description: "Stir 3 times.",
                           durationSeconds: 10,
                           action: .stir,
                           targetWaterWeight: nil),

                RecipeStep(title: "Cap & flip",
                           description: "Attach cap, press out excess air and flip onto server.",
                           durationSeconds: 5,
                           action: .flip,
                           targetWaterWeight: nil),

                RecipeStep(title: "Press",
                           description: "Start pressing.",
                           durationSeconds: 45,
                           action: .press,
                           targetWaterWeight: 170),

                RecipeStep(title: "Dilute",
                           description: "Dilute with 40–60 ml hot water depending on preference.",
                           durationSeconds: 0,
                           action: .serve,
                           targetWaterWeight: nil)
            ],
            accessories: [.doubleFilter],
            author: "Tommy Yrl",
            brewMethod: .inverted,
            grindDescription: nil,
            filterNotes: "Two paper filters, pre-wet",
            bypassWaterGrams: 60,
            bypassWaterTempCelsius: 95,
            tags: [.inverted, .bypass],
            sourceURL: nil
        )
    ]
}
