import SwiftUI

struct CreateRecipeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: RecipeData
    @AppStorage(SettingsKeys.defaultWaterTemp) private var defaultWaterTemp = noPreference
    @AppStorage(SettingsKeys.defaultRatio) private var defaultRatio = noPreference
    @AppStorage(SettingsKeys.preferredEquipment) private var preferredEquipment = noPreference
    @AppStorage(SettingsKeys.preferredCupType) private var preferredCupType = noPreference
    
    @State private var name = ""
    @State private var author = ""
    @State private var equipment: AeroPressEquipment = .original
    @State private var cupType: CupType = .regular
    @State private var brewMethod: BrewMethod = .upright
    @State private var coffeeGrams: Double = 15
    @State private var waterGrams: Double = 200
    @State private var waterTemp = 90
    @State private var grindDescription = "Medium Fine"
    @State private var steps: [RecipeStep] = []
    
    let grindSizes = ["Extra Coarse", "Coarse", "Medium Coarse", "Medium", "Medium Fine", "Fine", "Extra Fine"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basic Info")) {
                    TextField("Recipe Name", text: $name)
                    TextField("Author (optional)", text: $author)
                    Picker("Equipment", selection: $equipment) {
                        ForEach(AeroPressEquipment.allCases) { eq in
                            Text(eq.rawValue).tag(eq)
                        }
                    }
                    Picker("Cup Type", selection: $cupType) {
                        ForEach(CupType.allCases) { ct in
                            Text(ct.rawValue).tag(ct)
                        }
                    }
                    Picker("Brew Method", selection: $brewMethod) {
                        ForEach(BrewMethod.allCases) { mt in
                            Text(mt.rawValue).tag(mt)
                        }
                    }
                }
                
                Section(header: Text("Parameters")) {
                    HStack {
                        Text("Coffee Dose")
                        Spacer()
                        TextField("g", value: $coffeeGrams, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    HStack {
                        Text("Water Volume")
                        Spacer()
                        TextField("g", value: $waterGrams, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("g")
                    }
                    HStack {
                        Text("Water Temp")
                        Spacer()
                        TextField("°C", value: $waterTemp, format: .number)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                        Text("°C")
                    }
                    Picker("Grind Size", selection: $grindDescription) {
                        ForEach(grindSizes, id: \.self) { size in
                            Text(size).tag(size)
                        }
                    }
                }
                
                Section(header: Text("Steps")) {
                    List {
                        ForEach($steps) { $step in
                            VStack(alignment: .leading, spacing: 8) {
                                TextField("Step Title (e.g., Add Coffee)", text: $step.title)
                                    .font(.headline)
                                TextField("Instructions", text: Binding(
                                    get: { step.description ?? "" },
                                    set: { step.description = $0.isEmpty ? nil : $0 }
                                ))
                                    .font(.subheadline)
                                HStack {
                                    Text("Duration:")
                                    TextField("Seconds", value: $step.durationSeconds, format: .number)
                                        .keyboardType(.numberPad)
                                    Spacer()
                                    Picker("Action", selection: $step.action) {
                                        ForEach(StepAction.allCases) { act in
                                            Text(act.rawValue).tag(act)
                                        }
                                    }
                                    .pickerStyle(.menu)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete { indexSet in
                            steps.remove(atOffsets: indexSet)
                        }
                    }
                    Button(action: {
                        steps.append(RecipeStep(title: "Step \(steps.count + 1)", durationSeconds: 30, action: .steep))
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Step")
                        }
                    }
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newRecipe = Recipe(
                            name: name.isEmpty ? "Untitled Recipe" : name,
                            equipment: equipment,
                            cupTypes: [cupType],
                            coffeeAmountGrams: coffeeGrams,
                            waterAmountGrams: waterGrams,
                            waterTemperatureCelsius: waterTemp,
                            steps: steps.isEmpty ? [RecipeStep(title: "Brew", description: "Follow your heart.", durationSeconds: 60, action: .steep)] : steps,
                            isUserCreated: true,
                            author: author.isEmpty ? nil : author,
                            brewMethod: brewMethod,
                            grindDescription: grindDescription
                        )
                        data.recipes.append(newRecipe)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
            .onAppear {
                applyDefaults()
            }
        }
    }
    
    private func applyDefaults() {
        if !defaultWaterTemp.isEmpty, let temp = Int(defaultWaterTemp) {
            waterTemp = temp
        }
        if !defaultRatio.isEmpty {
            // e.g. "1:16" -> water/coffee = 16, use 200g water -> 200/16 ≈ 12.5g coffee
            let parts = defaultRatio.split(separator: ":")
            if parts.count == 2, let waterRatio = Double(parts[1]), waterRatio > 0 {
                coffeeGrams = waterGrams / waterRatio
            }
        }
        if !preferredEquipment.isEmpty, let eq = AeroPressEquipment(rawValue: preferredEquipment) {
            equipment = eq
        }
        if !preferredCupType.isEmpty, let ct = CupType(rawValue: preferredCupType) {
            cupType = ct
        }
    }
}
