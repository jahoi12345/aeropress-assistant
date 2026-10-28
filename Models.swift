import Foundation

enum AeroPressEquipment: String, CaseIterable, Identifiable, Codable {
    case original = "AeroPress Original"
    case go = "AeroPress Go"
    case xl = "AeroPress XL"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .original: return "ogaeropress"
        case .go: return "goaeropress"
        case .xl: return "xlaeropress"
        }
    }
    
    var iconType: IconType {
        return .assetImage
    }
}

enum IconType: String, Codable {
    case text
    case systemImage
    case assetImage
}

enum CupType: String, CaseIterable, Identifiable, Codable {
    case regular = "Regular"
    case espressoEsque = "Espresso-style"
    case iced = "Iced"
    case bypass = "Bypass"
    case pourover = "Pour-over"
    case coldBrew = "Cold Brew"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .regular: return "coffeenormal"
        case .espressoEsque: return "espresso"
        case .iced: return "ice-cube"
        case .bypass: return "water.waves"
        case .pourover: return "drop.fill"
        case .coldBrew: return "snowflake"
        }
    }
    
    var iconType: IconType {
        switch self {
        case .regular, .espressoEsque, .iced: return .assetImage
        default: return .systemImage
        }
    }
}

enum BrewMethod: String, CaseIterable, Identifiable, Codable {
    case upright = "Upright"
    case inverted = "Inverted"
    
    var id: String { self.rawValue }
}

enum Accessory: String, CaseIterable, Identifiable, Codable {
    case flowControl = "Flow Control"
    case metalFilter = "Metal Filter"
    case paperFilter = "Paper Filter"
    case aesirFilter = "Aesir Filter"
    case doubleFilter = "Double Filter"
    case linenFilter = "Linen Filter"
    case melodrip = "Melodrip"
    
    var id: String { self.rawValue }
}

enum StepAction: String, CaseIterable, Identifiable, Codable {
    case prep = "Prep"
    case pour = "Pour"
    case stir = "Stir"
    case steep = "Steep"
    case press = "Press"
    case flip = "Flip"
    case serve = "Serve"
    
    var id: String { self.rawValue }
}

enum RecipeTag: String, Codable, CaseIterable, Identifiable {
    case championship
    case inverted
    case upright
    case bypass
    case iced
    case diluted
    case flowControl
    case concentrate
    
    var id: String { self.rawValue }
}

enum RoastLevel: String, Codable, CaseIterable, Identifiable {
    case light = "Light"
    case mediumLight = "Medium-Light"
    case medium = "Medium"
    case mediumDark = "Medium-Dark"
    case dark = "Dark"
    
    var id: String { self.rawValue }
}

// MARK: - Recipe

struct Recipe: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var equipment: AeroPressEquipment
    var cupTypes: [CupType]
    var coffeeAmountGrams: Double
    var waterAmountGrams: Double?
    var waterTemperatureCelsius: Int?
    var steps: [RecipeStep]
    var accessories: [Accessory]?
    
    // State
    var isFavorite: Bool = false
    var isUserCreated: Bool = false
    
    // Championship / advanced metadata (optional)
    var author: String?
    var brewMethod: BrewMethod?
    var placement: Int?
    var competitionYear: Int?
    var country: String?
    
    var grindDescription: String?
    var filterNotes: String?
    
    var bypassWaterGrams: Double?
    var bypassWaterTempCelsius: Int?
    
    var beanSummary: String?
    var roastLevel: RoastLevel?
    
    var tags: [RecipeTag]?
    var rating: Double?
    var sourceURL: String?
    
    // Computed
    var ratio: String {
        guard coffeeAmountGrams > 0, let water = waterAmountGrams else { return "N/A" }
        let ratioValue = water / coffeeAmountGrams
        return "1:\(String(format: "%.1f", ratioValue))"
    }
    
    var totalTime: Int {
        steps.reduce(0) { $0 + $1.durationSeconds }
    }
}

// MARK: - RecipeStep

struct RecipeStep: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var durationSeconds: Int
    var action: StepAction
    var targetWaterWeight: Double?
    var pourAmountGrams: Double?
}

// MARK: - Journal & Bean

struct JournalEntry: Identifiable, Codable {
    var id: UUID = UUID()
    var date: Date
    var recipeName: String
    var beanName: String
    var notes: String
    var rating: Int? // 1 to 5 stars; nil = not set
    
    // 1. Identity & context
    var brewName: String?
    var cupType: CupType?
    
    // 2. Equipment and method
    var equipment: AeroPressEquipment?
    var brewMethod: BrewMethod?
    var accessories: [Accessory]?
    
    // 3. Recipe adherence
    var followedRecipeExactly: Bool?
    var coffeeUsedGrams: Double?
    var waterUsedGrams: Double?
    var waterTempCelsius: Int?
    var bypassWaterGrams: Double?
    var bypassWaterTempCelsius: Int?
    var totalBrewTimeSeconds: Int?
    var grindSize: String?
    
    // 4. Grind & prep
    var grindDescriptor: String?
    var roastLevel: RoastLevel?
    var preWetRinse: Bool?
    
    // 5. Rating & sensory
    var tastingNotes: String?
    var bodyLevel: String?  // Light, Medium, Full, etc.
    var acidity: String?
    var bitterness: String?
    var sweetness: String?
    var mouthfeel: String?
    var finish: String?
    var wouldBrewAgain: Bool?
    
    // 6. Notes & tags
    var tags: [String]?
    var moodOccasion: String?
    var whatWouldChange: String?
    
    // 7. Media & extras
    var photoData: Data?
    var location: String?
    
    // 8. Meta
    var isFavorite: Bool?
    var isPrivate: Bool?
    var relatedRecipeName: String?
    
    /// Backward-compatible initializer for minimal required fields; all else optional.
    init(
        id: UUID = UUID(),
        date: Date = Date(),
        recipeName: String = "",
        beanName: String = "",
        notes: String = "",
        rating: Int? = nil,
        brewName: String? = nil,
        cupType: CupType? = nil,
        equipment: AeroPressEquipment? = nil,
        brewMethod: BrewMethod? = nil,
        accessories: [Accessory]? = nil,
        followedRecipeExactly: Bool? = nil,
        coffeeUsedGrams: Double? = nil,
        waterUsedGrams: Double? = nil,
        waterTempCelsius: Int? = nil,
        bypassWaterGrams: Double? = nil,
        bypassWaterTempCelsius: Int? = nil,
        totalBrewTimeSeconds: Int? = nil,
        grindSize: String? = nil,
        grindDescriptor: String? = nil,
        roastLevel: RoastLevel? = nil,
        preWetRinse: Bool? = nil,
        tastingNotes: String? = nil,
        bodyLevel: String? = nil,
        acidity: String? = nil,
        bitterness: String? = nil,
        sweetness: String? = nil,
        mouthfeel: String? = nil,
        finish: String? = nil,
        wouldBrewAgain: Bool? = nil,
        tags: [String]? = nil,
        moodOccasion: String? = nil,
        whatWouldChange: String? = nil,
        photoData: Data? = nil,
        location: String? = nil,
        isFavorite: Bool? = nil,
        isPrivate: Bool? = nil,
        relatedRecipeName: String? = nil
    ) {
        self.id = id
        self.date = date
        self.recipeName = recipeName
        self.beanName = beanName
        self.notes = notes
        self.rating = rating
        self.brewName = brewName
        self.cupType = cupType
        self.equipment = equipment
        self.brewMethod = brewMethod
        self.accessories = accessories
        self.followedRecipeExactly = followedRecipeExactly
        self.coffeeUsedGrams = coffeeUsedGrams
        self.waterUsedGrams = waterUsedGrams
        self.waterTempCelsius = waterTempCelsius
        self.bypassWaterGrams = bypassWaterGrams
        self.bypassWaterTempCelsius = bypassWaterTempCelsius
        self.totalBrewTimeSeconds = totalBrewTimeSeconds
        self.grindSize = grindSize
        self.grindDescriptor = grindDescriptor
        self.roastLevel = roastLevel
        self.preWetRinse = preWetRinse
        self.tastingNotes = tastingNotes
        self.bodyLevel = bodyLevel
        self.acidity = acidity
        self.bitterness = bitterness
        self.sweetness = sweetness
        self.mouthfeel = mouthfeel
        self.finish = finish
        self.wouldBrewAgain = wouldBrewAgain
        self.tags = tags
        self.moodOccasion = moodOccasion
        self.whatWouldChange = whatWouldChange
        self.photoData = photoData
        self.location = location
        self.isFavorite = isFavorite
        self.isPrivate = isPrivate
        self.relatedRecipeName = relatedRecipeName
    }
}

// MARK: - Bean enums

enum BeanProcess: String, CaseIterable, Identifiable, Codable {
    case washed = "Washed"
    case natural = "Natural"
    case honey = "Honey"
    case anaerobic = "Anaerobic"
    case carbonic = "Carbonic Maceration"
    case wetHulled = "Wet-hulled"
    case other = "Other"
    var id: String { rawValue }
}

enum DecafMethod: String, CaseIterable, Identifiable, Codable {
    case swissWater = "Swiss Water"
    case co2 = "CO2"
    case ethylAcetate = "EA (Ethyl Acetate)"
    case sugarcane = "Sugarcane (SWP)"
    case other = "Other"
    case notApplicable = "Not applicable"
    var id: String { rawValue }
}

enum BlendType: String, CaseIterable, Identifiable, Codable {
    case singleOrigin = "Single origin"
    case blend = "Blend"
    var id: String { rawValue }
}

enum BeanStorage: String, CaseIterable, Identifiable, Codable {
    case pantry = "Pantry"
    case fridge = "Fridge"
    case freezer = "Freezer"
    case vacuum = "Vacuum canister"
    case other = "Other"
    var id: String { rawValue }
}

enum BagSize: String, CaseIterable, Identifiable, Codable {
    case g250 = "250 g"
    case g340 = "340 g"
    case oz12 = "12 oz"
    case lb1 = "1 lb"
    case kg1 = "1 kg"
    case other = "Other"
    var id: String { rawValue }
}

enum BeanTastingNoteTag: String, CaseIterable, Identifiable, Codable {
    case berry = "Berry"
    case stoneFruit = "Stone fruit"
    case citrus = "Citrus"
    case apple = "Apple"
    case tropical = "Tropical"
    case floral = "Floral"
    case chocolate = "Chocolate"
    case caramel = "Caramel"
    case nutty = "Nutty"
    case spice = "Spice"
    case wine = "Wine"
    case teaLike = "Tea-like"
    case earthy = "Earthy"
    case herbal = "Herbal"
    var id: String { rawValue }
}

enum BeanCertification: String, CaseIterable, Identifiable, Codable {
    case organic = "Organic"
    case fairTrade = "Fair Trade"
    case rainforestAlliance = "Rainforest Alliance"
    case directTrade = "Direct Trade"
    case other = "Other"
    var id: String { rawValue }
}

enum RecommendedBrewMethod: String, CaseIterable, Identifiable, Codable {
    case aeropress = "AeroPress"
    case espresso = "Espresso"
    case filter = "Filter"
    case frenchPress = "French press"
    case coldBrew = "Cold brew"
    case other = "Other"
    var id: String { rawValue }
}

// MARK: - Bean

struct Bean: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String  // Required; all other fields optional
    
    // 1. Identity & basics
    var roaster: String?
    var roasterLocation: String?
    var productLine: String?
    var variant: String?
    
    // 2. Roast & processing
    var roastLevel: RoastLevel?
    var roastDate: Date?
    var process: BeanProcess?
    var decaf: Bool?
    var decafMethod: DecafMethod?
    var blendType: BlendType?
    
    // 3. Origin & variety
    var origin: String?
    var region: String?
    var farmProducer: String?
    var variety: String?
    var altitude: String?
    var harvestYear: String?
    
    // 4. Tasting
    var tastingNotes: String?
    var suggestedTastingNotes: [BeanTastingNoteTag]?
    var body: String?
    var acidity: String?
    var sweetness: String?
    var yourRating: Int?  // 1–5
    
    // 5. Purchase & storage
    var purchaseDate: Date?
    var purchasePlace: String?
    var price: String?
    var bagSize: BagSize?
    var openDate: Date?
    var useByDate: Date?
    var storage: BeanStorage?
    
    // 6. Brew suggestions
    var recommendedGrind: String?
    var recommendedBrewMethods: [RecommendedBrewMethod]?
    var recommendedWaterTemp: String?
    var recommendedRatio: String?
    var aeroPressNotes: String?
    
    // 7. Organisation
    var tags: [String]?
    var isFavorite: Bool?
    var isWishlist: Bool?
    var isFinished: Bool?
    var isPrivate: Bool?
    
    // 8. Extras
    var photoData: Data?
    var productURL: String?
    var lotNumber: String?
    var certifications: [BeanCertification]?
    var notes: String?
    
    var dateAdded: Date?
}
