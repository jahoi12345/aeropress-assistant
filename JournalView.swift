import SwiftUI
import PhotosUI

struct JournalView: View {
    @EnvironmentObject var data: RecipeData
    @State private var showingAddEntry = false
    @State private var entryToEdit: JournalEntry? = nil
    @State private var displayedEmptySubtext: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if data.journalEntries.isEmpty {
                    VStack {
                        Image(systemName: "book.closed")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        Text("No brews logged yet.")
                            .font(.headline)
                            .padding(.top, 8)
                        Text(displayedEmptySubtext ?? EmptyStateSubtexts.brewJournal.first ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    List(data.journalEntries) { entry in
                        Button {
                            entryToEdit = entry
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(entry.recipeName.isEmpty ? "—" : entry.recipeName)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if let r = entry.rating {
                                        ForEach(1...5, id: \.self) { star in
                                            Image(systemName: star <= r ? "star.fill" : "star")
                                                .foregroundColor(star <= r ? .yellow : .gray)
                                                .font(.caption)
                                        }
                                    } else {
                                        Text("No rating")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Text("Beans: \(entry.beanName.isEmpty ? "—" : entry.beanName)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(entry.date, style: .date)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                if !entry.notes.isEmpty {
                                    Text(entry.notes)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .padding(.top, 4)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Brew Journal")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.mediumImpact() })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Haptics.mediumImpact()
                        showingAddEntry = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddEntry) {
                AddJournalEntryView()
            }
            .sheet(item: $entryToEdit) { entry in
                AddJournalEntryView(entryToEdit: entry)
            }
            .onAppear {
                if data.journalEntries.isEmpty {
                    displayedEmptySubtext = EmptyStateSubtexts.brewJournal.randomElement()
                }
            }
        }
    }
}

// MARK: - Add Journal Entry (all fields optional)

private let sensoryLevels = ["Not set", "Low", "Medium-Low", "Medium", "Medium-High", "High"]
private let grindDescriptors = ["Not set", "Fine", "Medium-Fine", "Medium", "Medium-Coarse", "Coarse"]
private let moodOptions = ["Not set", "Morning", "Afternoon", "Evening", "Guest", "Travel", "Experiment", "Other"]

struct AddJournalEntryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: RecipeData
    @AppStorage(SettingsKeys.useMetricUnits) private var useMetricUnits = true
    
    var initialRecipeName: String? = nil
    /// When set, form is in edit mode and Save updates this entry instead of adding.
    var entryToEdit: JournalEntry? = nil
    
    // 1. Identity & context
    @State private var recipeName = ""
    @State private var beanName = ""
    @State private var date = Date()
    @State private var cupType: CupType? = nil
    @State private var brewName = ""
    
    // 2. Equipment and method
    @State private var equipment: AeroPressEquipment? = nil
    @State private var brewMethod: BrewMethod? = nil
    @State private var selectedAccessories: Set<Accessory> = []
    
    // 3. Recipe adherence
    @State private var followedRecipeExactly: Bool? = nil
    @State private var coffeeUsedGramsText = ""
    @State private var waterUsedGramsText = ""
    @State private var waterTempText = ""
    @State private var bypassWaterGramsText = ""
    @State private var bypassWaterTempText = ""
    @State private var brewTimeMinutes = 0
    @State private var brewTimeSeconds = 0
    @State private var grindSize = ""
    
    // 4. Grind & prep
    @State private var grindDescriptorIndex = 0
    @State private var roastLevel: RoastLevel? = nil
    @State private var preWetRinse: Bool? = nil
    
    // 5. Rating & sensory
    @State private var ratingOptional: Int? = nil  // nil = not set, 1...5 = stars
    @State private var tastingNotes = ""
    @State private var bodyLevelIndex = 0
    @State private var acidityIndex = 0
    @State private var bitternessIndex = 0
    @State private var sweetnessIndex = 0
    @State private var mouthfeel = ""
    @State private var finish = ""
    @State private var wouldBrewAgain: Bool? = nil
    
    // 6. Notes & tags
    @State private var notes = ""
    @State private var tagsText = ""
    @State private var moodIndex = 0
    @State private var moodCustom = ""
    @State private var whatWouldChange = ""
    
    // 7. Media & extras
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var photoData: Data? = nil
    @State private var location = ""
    
    // 8. Meta (toggles)
    @State private var isFavorite = false
    @State private var isPrivate = false
    @State private var relatedRecipeName: String? = nil
    
    /// Logged beans whose name or roaster matches the current bean name text (for autofill).
    private var suggestedBeansForBrew: [Bean] {
        let query = beanName.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !query.isEmpty else { return [] }
        return data.beans.filter { bean in
            bean.name.lowercased().contains(query) ||
            (bean.roaster?.lowercased().contains(query) ?? false)
        }
    }
    
    private func beanDisplayString(_ bean: Bean) -> String {
        if let r = bean.roaster, !r.isEmpty {
            return "\(bean.name) · \(r)"
        }
        return bean.name
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // 1. Identity & context
                Section(header: Text("Identity & context")) {
                    Picker("Recipe used", selection: $recipeName) {
                        Text("Not set").tag("")
                        Text("Custom / Other").tag("Custom")
                        ForEach(data.recipes) { recipe in
                            AeroPressHighlight.text(recipe.name).tag(recipe.name)
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("Bean name / roaster", text: $beanName)
                    if !suggestedBeansForBrew.isEmpty {
                        ForEach(suggestedBeansForBrew.prefix(5)) { bean in
                            Button {
                                beanName = beanDisplayString(bean)
                            } label: {
                                HStack {
                                    Text(bean.name)
                                        .foregroundColor(.primary)
                                    if let r = bean.roaster, !r.isEmpty {
                                        Text("· \(r)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Image(systemName: "arrow.up.left")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    DatePicker("Date & time", selection: $date)
                    Picker("Cup type", selection: $cupType) {
                        Text("Not set").tag(nil as CupType?)
                        ForEach(CupType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type as CupType?)
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("Brew name / title", text: $brewName)
                }
                
                // 2. Equipment and method
                Section(header: Text("Equipment and method")) {
                    Picker("Equipment", selection: $equipment) {
                        Text("Not set").tag(nil as AeroPressEquipment?)
                        ForEach(AeroPressEquipment.allCases, id: \.self) { eq in
                            Text(eq.rawValue).tag(eq as AeroPressEquipment?)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Brew method", selection: $brewMethod) {
                        Text("Not set").tag(nil as BrewMethod?)
                        ForEach(BrewMethod.allCases, id: \.self) { method in
                            Text(method.rawValue).tag(method as BrewMethod?)
                        }
                    }
                    .pickerStyle(.menu)
                    Group {
                        Text("Accessories")
                        ForEach(Accessory.allCases, id: \.self) { acc in
                            Toggle(acc.rawValue, isOn: Binding(
                                get: { selectedAccessories.contains(acc) },
                                set: { Haptics.lightImpact(); if $0 { selectedAccessories.insert(acc) } else { selectedAccessories.remove(acc) } }
                            ))
                        }
                    }
                }
                
                // 3. Recipe adherence
                Section(header: Text("Recipe adherence")) {
                    Picker("Followed recipe exactly?", selection: $followedRecipeExactly) {
                        Text("Not set").tag(nil as Bool?)
                        Text("Yes").tag(true as Bool?)
                        Text("No").tag(false as Bool?)
                    }
                    .pickerStyle(.menu)
                    HStack {
                        Text("Coffee used (\(useMetricUnits ? "g" : "oz"))")
                        Spacer()
                        TextField("Optional", text: $coffeeUsedGramsText)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water used (\(useMetricUnits ? "g" : "mL"))")
                        Spacer()
                        TextField("Optional", text: $waterUsedGramsText)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Water temp (°\(useMetricUnits ? "C" : "F"))")
                        Spacer()
                        TextField("Optional", text: $waterTempText)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Bypass water (\(useMetricUnits ? "g" : "mL"))")
                        Spacer()
                        TextField("Optional", text: $bypassWaterGramsText)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Bypass water temp (°\(useMetricUnits ? "C" : "F"))")
                        Spacer()
                        TextField("Optional", text: $bypassWaterTempText)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Total brew time")
                        Spacer()
                        Picker("", selection: $brewTimeMinutes) {
                            ForEach(0..<61, id: \.self) { Text("\($0)").tag($0) }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .frame(width: 64)
                        Text("min")
                            .foregroundColor(.secondary)
                        Picker("", selection: $brewTimeSeconds) {
                            ForEach(0..<60, id: \.self) { Text("\($0)").tag($0) }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .frame(width: 64)
                        Text("sec")
                            .foregroundColor(.secondary)
                    }
                    TextField("Grind size / setting", text: $grindSize)
                }
                
                // 4. Grind & prep
                Section(header: Text("Grind & prep")) {
                    Picker("Grind descriptor", selection: $grindDescriptorIndex) {
                        ForEach(Array(grindDescriptors.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Roast level", selection: $roastLevel) {
                        Text("Not set").tag(nil as RoastLevel?)
                        ForEach(RoastLevel.allCases, id: \.self) { level in
                            Text(level.rawValue).tag(level as RoastLevel?)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Pre-wet / rinse", selection: $preWetRinse) {
                        Text("Not set").tag(nil as Bool?)
                        Text("Yes").tag(true as Bool?)
                        Text("No").tag(false as Bool?)
                    }
                    .pickerStyle(.menu)
                }
                
                // 5. Rating & sensory
                Section(header: Text("Rating & sensory")) {
                    Picker("Overall rating", selection: $ratingOptional) {
                        Text("Not set").tag(nil as Int?)
                        ForEach(1...5, id: \.self) { num in
                            Text("\(num) stars").tag(num as Int?)
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("Tasting notes", text: $tastingNotes, axis: .vertical)
                        .lineLimit(3...6)
                    Picker("Body", selection: $bodyLevelIndex) {
                        ForEach(Array(sensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Acidity", selection: $acidityIndex) {
                        ForEach(Array(sensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Bitterness", selection: $bitternessIndex) {
                        ForEach(Array(sensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Sweetness", selection: $sweetnessIndex) {
                        ForEach(Array(sensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("Mouthfeel", text: $mouthfeel)
                    TextField("Finish", text: $finish)
                    Picker("Would brew again?", selection: $wouldBrewAgain) {
                        Text("Not set").tag(nil as Bool?)
                        Text("Yes").tag(true as Bool?)
                        Text("No").tag(false as Bool?)
                    }
                    .pickerStyle(.menu)
                }
                
                // 6. Notes & tags
                Section(header: Text("Notes & tags")) {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                    TextField("Tags (comma-separated)", text: $tagsText)
                    Picker("Mood / occasion", selection: $moodIndex) {
                        ForEach(Array(moodOptions.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    if moodIndex == moodOptions.count - 1 {
                        TextField("Custom mood", text: $moodCustom)
                    }
                    TextField("What you'd change", text: $whatWouldChange, axis: .vertical)
                        .lineLimit(2...4)
                }
                
                // 7. Media & extras (photo + location only)
                Section(header: Text("Media & extras")) {
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        HStack {
                            if let data = photoData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(8)
                            } else {
                                Image(systemName: "photo")
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                            }
                            Text(photoData == nil ? "Add photo" : "Change photo")
                        }
                    }
                    .onChange(of: selectedPhoto) { newItem in
                        Task { @MainActor in
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                photoData = data
                            }
                        }
                    }
                    TextField("Location", text: $location)
                }
                
                // 8. Meta
                Section(header: Text("Meta")) {
                    Toggle("Favorite", isOn: $isFavorite)
                        .onChange(of: isFavorite) { _ in Haptics.lightImpact() }
                    Toggle("Private / hide from export", isOn: $isPrivate)
                        .onChange(of: isPrivate) { _ in Haptics.lightImpact() }
                    Picker("Related recipe", selection: $relatedRecipeName) {
                        Text("Not set").tag(nil as String?)
                        ForEach(data.recipes) { recipe in
                            Text(recipe.name).tag(Optional(recipe.name) as String?)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle(entryToEdit == nil ? "Log a Brew" : "Edit Brew")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveEntry()
                    }
                }
            }
            .onAppear {
                if let e = entryToEdit {
                    populateFromEntry(e)
                } else {
                    if let name = initialRecipeName, !name.isEmpty {
                        recipeName = name
                    } else if recipeName.isEmpty, let first = data.recipes.first {
                        recipeName = first.name
                    }
                }
            }
        }
    }
    
    private func saveEntry() {
        let totalSeconds = brewTimeMinutes * 60 + brewTimeSeconds
        let tags: [String]? = tagsText.isEmpty ? nil : tagsText.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }.filter { !$0.isEmpty }
        let mood: String? = moodIndex == 0 ? nil : (moodIndex == moodOptions.count - 1 ? (moodCustom.isEmpty ? nil : moodCustom) : moodOptions[moodIndex])
        
        let resolvedRecipeName = recipeName.isEmpty ? "" : (recipeName == "Custom" ? "Custom Recipe" : recipeName)
        let entryId = entryToEdit?.id ?? UUID()
        
        let updatedEntry = JournalEntry(
            id: entryId,
            date: date,
            recipeName: resolvedRecipeName,
            beanName: beanName,
            notes: notes,
            rating: ratingOptional,
            brewName: brewName.isEmpty ? nil : brewName,
            cupType: cupType,
            equipment: equipment,
            brewMethod: brewMethod,
            accessories: selectedAccessories.isEmpty ? nil : Array(selectedAccessories),
            followedRecipeExactly: followedRecipeExactly,
            coffeeUsedGrams: Double(coffeeUsedGramsText.replacingOccurrences(of: ",", with: ".")),
            waterUsedGrams: Double(waterUsedGramsText.replacingOccurrences(of: ",", with: ".")),
            waterTempCelsius: Int(waterTempText),
            bypassWaterGrams: Double(bypassWaterGramsText.replacingOccurrences(of: ",", with: ".")),
            bypassWaterTempCelsius: Int(bypassWaterTempText),
            totalBrewTimeSeconds: totalSeconds > 0 ? totalSeconds : nil,
            grindSize: grindSize.isEmpty ? nil : grindSize,
            grindDescriptor: grindDescriptorIndex == 0 ? nil : grindDescriptors[grindDescriptorIndex],
            roastLevel: roastLevel,
            preWetRinse: preWetRinse,
            tastingNotes: tastingNotes.isEmpty ? nil : tastingNotes,
            bodyLevel: bodyLevelIndex == 0 ? nil : sensoryLevels[bodyLevelIndex],
            acidity: acidityIndex == 0 ? nil : sensoryLevels[acidityIndex],
            bitterness: bitternessIndex == 0 ? nil : sensoryLevels[bitternessIndex],
            sweetness: sweetnessIndex == 0 ? nil : sensoryLevels[sweetnessIndex],
            mouthfeel: mouthfeel.isEmpty ? nil : mouthfeel,
            finish: finish.isEmpty ? nil : finish,
            wouldBrewAgain: wouldBrewAgain,
            tags: tags,
            moodOccasion: mood,
            whatWouldChange: whatWouldChange.isEmpty ? nil : whatWouldChange,
            photoData: photoData,
            location: location.isEmpty ? nil : location,
            isFavorite: isFavorite,
            isPrivate: isPrivate,
            relatedRecipeName: (relatedRecipeName ?? "").isEmpty ? nil : relatedRecipeName
        )
        
        if let existing = entryToEdit, let idx = data.journalEntries.firstIndex(where: { $0.id == existing.id }) {
            data.journalEntries[idx] = updatedEntry
        } else {
            data.journalEntries.insert(updatedEntry, at: 0)
        }
        dismiss()
    }
    
    private func populateFromEntry(_ e: JournalEntry) {
        recipeName = e.recipeName.isEmpty ? "" : (e.recipeName == "Custom Recipe" ? "Custom" : e.recipeName)
        beanName = e.beanName
        date = e.date
        cupType = e.cupType
        brewName = e.brewName ?? ""
        equipment = e.equipment
        brewMethod = e.brewMethod
        selectedAccessories = Set(e.accessories ?? [])
        followedRecipeExactly = e.followedRecipeExactly
        coffeeUsedGramsText = e.coffeeUsedGrams.map { String(format: "%g", $0) } ?? ""
        waterUsedGramsText = e.waterUsedGrams.map { String(format: "%g", $0) } ?? ""
        waterTempText = e.waterTempCelsius.map { String($0) } ?? ""
        bypassWaterGramsText = e.bypassWaterGrams.map { String(format: "%g", $0) } ?? ""
        bypassWaterTempText = e.bypassWaterTempCelsius.map { String($0) } ?? ""
        if let total = e.totalBrewTimeSeconds {
            brewTimeMinutes = total / 60
            brewTimeSeconds = total % 60
        }
        grindSize = e.grindSize ?? ""
        grindDescriptorIndex = e.grindDescriptor.flatMap { grindDescriptors.firstIndex(of: $0) } ?? 0
        roastLevel = e.roastLevel
        preWetRinse = e.preWetRinse
        ratingOptional = e.rating
        tastingNotes = e.tastingNotes ?? ""
        bodyLevelIndex = e.bodyLevel.flatMap { sensoryLevels.firstIndex(of: $0) } ?? 0
        acidityIndex = e.acidity.flatMap { sensoryLevels.firstIndex(of: $0) } ?? 0
        bitternessIndex = e.bitterness.flatMap { sensoryLevels.firstIndex(of: $0) } ?? 0
        sweetnessIndex = e.sweetness.flatMap { sensoryLevels.firstIndex(of: $0) } ?? 0
        mouthfeel = e.mouthfeel ?? ""
        finish = e.finish ?? ""
        wouldBrewAgain = e.wouldBrewAgain
        notes = e.notes
        tagsText = (e.tags ?? []).joined(separator: ", ")
        if let m = e.moodOccasion, let idx = moodOptions.firstIndex(of: m) {
            moodIndex = idx
            moodCustom = ""
        } else if let m = e.moodOccasion, !m.isEmpty {
            moodIndex = moodOptions.count - 1
            moodCustom = m
        }
        whatWouldChange = e.whatWouldChange ?? ""
        photoData = e.photoData
        location = e.location ?? ""
        isFavorite = e.isFavorite ?? false
        isPrivate = e.isPrivate ?? false
        relatedRecipeName = e.relatedRecipeName
    }
}
struct BeansJournalView: View {
    @EnvironmentObject var data: RecipeData
    @State private var showingAddBean = false
    @State private var beanToEdit: Bean? = nil
    @State private var displayedEmptySubtext: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if data.beans.isEmpty {
                    VStack {
                        Image("coffee-beans")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.secondary)
                        Text("No beans logged yet.")
                            .font(.headline)
                            .padding(.top, 8)
                        Text(displayedEmptySubtext ?? EmptyStateSubtexts.beansJournal.first ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    List(data.beans) { bean in
                        Button {
                            beanToEdit = bean
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(bean.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                if let roaster = bean.roaster, !roaster.isEmpty {
                                    Text("Roaster: \(roaster)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                HStack(spacing: 6) {
                                    if let level = bean.roastLevel {
                                        Text(level.rawValue)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.brown.opacity(0.2))
                                            .cornerRadius(8)
                                            .font(.caption)
                                    }
                                    if let origin = bean.origin, !origin.isEmpty {
                                        Text(origin)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(8)
                                            .font(.caption)
                                    }
                                }
                                .padding(.top, 2)
                                if let notes = bean.tastingNotes, !notes.isEmpty {
                                    Text("Notes: \(notes)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .padding(.top, 4)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Beans Journal")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                    .simultaneousGesture(TapGesture().onEnded { Haptics.mediumImpact() })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Haptics.mediumImpact()
                        showingAddBean = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBean) {
                AddBeanView()
            }
            .sheet(item: $beanToEdit) { bean in
                AddBeanView(beanToEdit: bean)
            }
            .onAppear {
                if data.beans.isEmpty {
                    displayedEmptySubtext = EmptyStateSubtexts.beansJournal.randomElement()
                }
            }
        }
    }
}

// MARK: - Add Bean constants

private let beanSensoryLevels = ["Not set", "Low", "Medium-Low", "Medium", "Medium-High", "High"]

// MARK: - Add Bean View

struct AddBeanView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: RecipeData
    
    var beanToEdit: Bean? = nil
    
    // 1. Identity & basics
    @State private var name = ""
    @State private var roaster = ""
    @State private var roasterLocation = ""
    @State private var productLine = ""
    @State private var variant = ""
    
    // 2. Roast & processing
    @State private var roastLevel: RoastLevel? = nil
    @State private var roastDate: Date?
    @State private var process: BeanProcess? = nil
    @State private var decaf: Bool? = nil
    @State private var decafMethod: DecafMethod? = nil
    @State private var blendType: BlendType? = nil
    
    // 3. Origin & variety
    @State private var origin = ""
    @State private var region = ""
    @State private var farmProducer = ""
    @State private var variety = ""
    @State private var altitude = ""
    @State private var harvestYear = ""
    
    // 4. Tasting
    @State private var tastingNotes = ""
    @State private var selectedTastingNoteTags: Set<BeanTastingNoteTag> = []
    @State private var bodyIndex = 0
    @State private var acidityIndex = 0
    @State private var sweetnessIndex = 0
    @State private var yourRating: Int? = nil
    
    // 5. Purchase & storage
    @State private var purchaseDate: Date?
    @State private var purchasePlace = ""
    @State private var price = ""
    @State private var bagSize: BagSize? = nil
    @State private var openDate: Date?
    @State private var useByDate: Date?
    @State private var storage: BeanStorage? = nil
    
    // 6. Brew suggestions
    @State private var recommendedGrind = ""
    @State private var selectedBrewMethods: Set<RecommendedBrewMethod> = []
    @State private var recommendedWaterTemp = ""
    @State private var recommendedRatio = ""
    @State private var aeroPressNotes = ""
    
    // 7. Organisation
    @State private var tagsText = ""
    @State private var isFavorite = false
    @State private var isWishlist = false
    @State private var isFinished = false
    @State private var isPrivate = false
    
    // 8. Extras
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var photoData: Data? = nil
    @State private var productURL = ""
    @State private var lotNumber = ""
    @State private var selectedCertifications: Set<BeanCertification> = []
    @State private var notes = ""
    
    private var isEditing: Bool { beanToEdit != nil }
    
    var body: some View {
        NavigationStack {
            Form {
                // 1. Identity & basics
                Section(header: Text("Identity & basics")) {
                    TextField("Name / Blend (required)", text: $name)
                    TextField("Roaster", text: $roaster)
                    TextField("Roaster location", text: $roasterLocation)
                    TextField("Product line / series", text: $productLine)
                    TextField("Variant (e.g. Decaf)", text: $variant)
                }
                
                // 2. Roast & processing
                Section(header: Text("Roast & processing")) {
                    Picker("Roast level", selection: $roastLevel) {
                        Text("Not set").tag(nil as RoastLevel?)
                        ForEach(RoastLevel.allCases, id: \.self) { level in
                            Text(level.rawValue).tag(level as RoastLevel?)
                        }
                    }
                    .pickerStyle(.menu)
                    if roastDate != nil {
                        HStack {
                            DatePicker("Roast date", selection: Binding(get: { roastDate ?? Date() }, set: { roastDate = $0 }), displayedComponents: .date)
                            Button("Clear", role: .destructive) { roastDate = nil }
                                .font(.caption)
                        }
                    } else {
                        Button("Add roast date") { roastDate = Date() }
                    }
                    Picker("Process", selection: $process) {
                        Text("Not set").tag(nil as BeanProcess?)
                        ForEach(BeanProcess.allCases) { p in
                            Text(p.rawValue).tag(p as BeanProcess?)
                        }
                    }
                    .pickerStyle(.menu)
                    Toggle("Decaf", isOn: Binding(
                        get: { decaf ?? false },
                        set: { Haptics.lightImpact(); decaf = $0 }
                    ))
                    if decaf == true {
                        Picker("Decaf method", selection: $decafMethod) {
                            Text("Not set").tag(nil as DecafMethod?)
                            ForEach(DecafMethod.allCases) { m in
                                Text(m.rawValue).tag(m as DecafMethod?)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    Toggle("Single origin", isOn: Binding(
                        get: { blendType == .singleOrigin },
                        set: { Haptics.lightImpact(); blendType = $0 ? .singleOrigin : .blend }
                    ))
                }
                
                // 3. Origin & variety
                Section(header: Text("Origin & variety")) {
                    TextField("Origin (country/region)", text: $origin)
                    TextField("Region (e.g. Yirgacheffe)", text: $region)
                    TextField("Farm / producer", text: $farmProducer)
                    TextField("Variety", text: $variety)
                    TextField("Altitude", text: $altitude)
                    TextField("Harvest year / season", text: $harvestYear)
                }
                
                // 4. Tasting
                Section(header: Text("Tasting")) {
                    TextField("Tasting notes (free text)", text: $tastingNotes, axis: .vertical)
                        .lineLimit(2...5)
                    Group {
                        Text("Suggested notes (multi-select)")
                        ForEach(BeanTastingNoteTag.allCases) { tag in
                            Toggle(tag.rawValue, isOn: Binding(
                                get: { selectedTastingNoteTags.contains(tag) },
                                set: { Haptics.lightImpact(); if $0 { selectedTastingNoteTags.insert(tag) } else { selectedTastingNoteTags.remove(tag) } }
                            ))
                        }
                    }
                    Picker("Body", selection: $bodyIndex) {
                        ForEach(Array(beanSensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Acidity", selection: $acidityIndex) {
                        ForEach(Array(beanSensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Sweetness", selection: $sweetnessIndex) {
                        ForEach(Array(beanSensoryLevels.enumerated()), id: \.offset) { i, s in
                            Text(s).tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    Picker("Your rating (1–5)", selection: $yourRating) {
                        Text("Not set").tag(nil as Int?)
                        ForEach(1...5, id: \.self) { n in
                            Text("\(n) stars").tag(n as Int?)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // 5. Purchase & storage
                Section(header: Text("Purchase & storage")) {
                    if purchaseDate != nil {
                        HStack {
                            DatePicker("Purchase date", selection: Binding(get: { purchaseDate ?? Date() }, set: { purchaseDate = $0 }), displayedComponents: .date)
                            Button("Clear", role: .destructive) { purchaseDate = nil }
                                .font(.caption)
                        }
                    } else {
                        Button("Add purchase date") { purchaseDate = Date() }
                    }
                    TextField("Purchase place", text: $purchasePlace)
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                    Picker("Bag size", selection: $bagSize) {
                        Text("Not set").tag(nil as BagSize?)
                        ForEach(BagSize.allCases) { b in
                            Text(b.rawValue).tag(b as BagSize?)
                        }
                    }
                    .pickerStyle(.menu)
                    if openDate != nil {
                        HStack {
                            DatePicker("Open date", selection: Binding(get: { openDate ?? Date() }, set: { openDate = $0 }), displayedComponents: .date)
                            Button("Clear", role: .destructive) { openDate = nil }
                                .font(.caption)
                        }
                    } else {
                        Button("Add open date") { openDate = Date() }
                    }
                    if useByDate != nil {
                        HStack {
                            DatePicker("Use-by date", selection: Binding(get: { useByDate ?? Date() }, set: { useByDate = $0 }), displayedComponents: .date)
                            Button("Clear", role: .destructive) { useByDate = nil }
                                .font(.caption)
                        }
                    } else {
                        Button("Add use-by date") { useByDate = Date() }
                    }
                    Picker("Storage", selection: $storage) {
                        Text("Not set").tag(nil as BeanStorage?)
                        ForEach(BeanStorage.allCases) { s in
                            Text(s.rawValue).tag(s as BeanStorage?)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // 6. Brew suggestions
                Section(header: Text("Brew suggestions")) {
                    TextField("Recommended grind", text: $recommendedGrind)
                    Group {
                        Text("Recommended brew methods")
                        ForEach(RecommendedBrewMethod.allCases) { method in
                            Toggle(method.rawValue, isOn: Binding(
                                get: { selectedBrewMethods.contains(method) },
                                set: { Haptics.lightImpact(); if $0 { selectedBrewMethods.insert(method) } else { selectedBrewMethods.remove(method) } }
                            ))
                        }
                    }
                    TextField("Water temp (e.g. 92–96 °C)", text: $recommendedWaterTemp)
                    TextField("Ratio (e.g. 1:15)", text: $recommendedRatio)
                    TextField("AeroPress notes", text: $aeroPressNotes, axis: .vertical)
                        .lineLimit(2...4)
                }
                
                // 7. Organisation
                Section(header: Text("Organisation")) {
                    TextField("Tags (comma-separated)", text: $tagsText)
                    Toggle("Favourite", isOn: $isFavorite)
                        .onChange(of: isFavorite) { _ in Haptics.lightImpact() }
                    Toggle("Wishlist / to try", isOn: $isWishlist)
                        .onChange(of: isWishlist) { _ in Haptics.lightImpact() }
                    Toggle("Finished / archived", isOn: $isFinished)
                        .onChange(of: isFinished) { _ in Haptics.lightImpact() }
                    Toggle("Private", isOn: $isPrivate)
                        .onChange(of: isPrivate) { _ in Haptics.lightImpact() }
                }
                
                // 8. Extras
                Section(header: Text("Extras")) {
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        HStack {
                            if let data = photoData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .cornerRadius(8)
                            } else {
                                Image(systemName: "photo")
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                            }
                            Text(photoData == nil ? "Add photo" : "Change photo")
                        }
                    }
                    .onChange(of: selectedPhoto) { newItem in
                        Task { @MainActor in
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                photoData = data
                            }
                        }
                    }
                    TextField("Product URL", text: $productURL)
                        .keyboardType(.URL)
                        .textInputAutocapitalization(.never)
                    TextField("Lot / batch number", text: $lotNumber)
                    Group {
                        Text("Certifications")
                        ForEach(BeanCertification.allCases) { cert in
                            Toggle(cert.rawValue, isOn: Binding(
                                get: { selectedCertifications.contains(cert) },
                                set: { Haptics.lightImpact(); if $0 { selectedCertifications.insert(cert) } else { selectedCertifications.remove(cert) } }
                            ))
                        }
                    }
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(2...5)
                }
            }
            .navigationTitle(isEditing ? "Edit Bean" : "Log New Beans")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveBean()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .onAppear {
                if let b = beanToEdit {
                    populateFromBean(b)
                }
            }
        }
    }
    
    private func saveBean() {
        let tags: [String]? = tagsText.isEmpty ? nil : tagsText.split(separator: ",").map { String($0.trimmingCharacters(in: .whitespaces)) }.filter { !$0.isEmpty }
        let bodyStr = bodyIndex == 0 ? nil : beanSensoryLevels[bodyIndex]
        let acidityStr = acidityIndex == 0 ? nil : beanSensoryLevels[acidityIndex]
        let sweetnessStr = sweetnessIndex == 0 ? nil : beanSensoryLevels[sweetnessIndex]
        
        let beanId = beanToEdit?.id ?? UUID()
        let newBean = Bean(
            id: beanId,
            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
            roaster: roaster.isEmpty ? nil : roaster,
            roasterLocation: roasterLocation.isEmpty ? nil : roasterLocation,
            productLine: productLine.isEmpty ? nil : productLine,
            variant: variant.isEmpty ? nil : variant,
            roastLevel: roastLevel,
            roastDate: roastDate,
            process: process,
            decaf: decaf,
            decafMethod: decafMethod,
            blendType: blendType,
            origin: origin.isEmpty ? nil : origin,
            region: region.isEmpty ? nil : region,
            farmProducer: farmProducer.isEmpty ? nil : farmProducer,
            variety: variety.isEmpty ? nil : variety,
            altitude: altitude.isEmpty ? nil : altitude,
            harvestYear: harvestYear.isEmpty ? nil : harvestYear,
            tastingNotes: tastingNotes.isEmpty ? nil : tastingNotes,
            suggestedTastingNotes: selectedTastingNoteTags.isEmpty ? nil : Array(selectedTastingNoteTags),
            body: bodyStr,
            acidity: acidityStr,
            sweetness: sweetnessStr,
            yourRating: yourRating,
            purchaseDate: purchaseDate,
            purchasePlace: purchasePlace.isEmpty ? nil : purchasePlace,
            price: price.isEmpty ? nil : price,
            bagSize: bagSize,
            openDate: openDate,
            useByDate: useByDate,
            storage: storage,
            recommendedGrind: recommendedGrind.isEmpty ? nil : recommendedGrind,
            recommendedBrewMethods: selectedBrewMethods.isEmpty ? nil : Array(selectedBrewMethods),
            recommendedWaterTemp: recommendedWaterTemp.isEmpty ? nil : recommendedWaterTemp,
            recommendedRatio: recommendedRatio.isEmpty ? nil : recommendedRatio,
            aeroPressNotes: aeroPressNotes.isEmpty ? nil : aeroPressNotes,
            tags: tags,
            isFavorite: isFavorite,
            isWishlist: isWishlist,
            isFinished: isFinished,
            isPrivate: isPrivate,
            photoData: photoData,
            productURL: productURL.isEmpty ? nil : productURL,
            lotNumber: lotNumber.isEmpty ? nil : lotNumber,
            certifications: selectedCertifications.isEmpty ? nil : Array(selectedCertifications),
            notes: notes.isEmpty ? nil : notes,
            dateAdded: beanToEdit?.dateAdded ?? Date()
        )
        
        if let existing = beanToEdit, let idx = data.beans.firstIndex(where: { $0.id == existing.id }) {
            data.beans[idx] = newBean
        } else {
            data.beans.insert(newBean, at: 0)
        }
        dismiss()
    }
    
    private func populateFromBean(_ b: Bean) {
        name = b.name
        roaster = b.roaster ?? ""
        roasterLocation = b.roasterLocation ?? ""
        productLine = b.productLine ?? ""
        variant = b.variant ?? ""
        roastLevel = b.roastLevel
        roastDate = b.roastDate
        process = b.process
        decaf = b.decaf
        decafMethod = b.decafMethod
        blendType = b.blendType
        origin = b.origin ?? ""
        region = b.region ?? ""
        farmProducer = b.farmProducer ?? ""
        variety = b.variety ?? ""
        altitude = b.altitude ?? ""
        harvestYear = b.harvestYear ?? ""
        tastingNotes = b.tastingNotes ?? ""
        selectedTastingNoteTags = Set(b.suggestedTastingNotes ?? [])
        bodyIndex = b.body.flatMap { beanSensoryLevels.firstIndex(of: $0) } ?? 0
        acidityIndex = b.acidity.flatMap { beanSensoryLevels.firstIndex(of: $0) } ?? 0
        sweetnessIndex = b.sweetness.flatMap { beanSensoryLevels.firstIndex(of: $0) } ?? 0
        yourRating = b.yourRating
        purchaseDate = b.purchaseDate
        purchasePlace = b.purchasePlace ?? ""
        price = b.price ?? ""
        bagSize = b.bagSize
        openDate = b.openDate
        useByDate = b.useByDate
        storage = b.storage
        recommendedGrind = b.recommendedGrind ?? ""
        selectedBrewMethods = Set(b.recommendedBrewMethods ?? [])
        recommendedWaterTemp = b.recommendedWaterTemp ?? ""
        recommendedRatio = b.recommendedRatio ?? ""
        aeroPressNotes = b.aeroPressNotes ?? ""
        tagsText = (b.tags ?? []).joined(separator: ", ")
        isFavorite = b.isFavorite ?? false
        isWishlist = b.isWishlist ?? false
        isFinished = b.isFinished ?? false
        isPrivate = b.isPrivate ?? false
        photoData = b.photoData
        productURL = b.productURL ?? ""
        lotNumber = b.lotNumber ?? ""
        selectedCertifications = Set(b.certifications ?? [])
        notes = b.notes ?? ""
    }
}
