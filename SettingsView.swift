import SwiftUI

// MARK: - Settings Keys (for use across app)
enum SettingsKeys {
    static let useMetricUnits = "useMetricUnits"
    static let grinderType = "grinderType"
    static let grinderCustom = "grinderCustom"
    static let defaultWaterTemp = "defaultWaterTemp"
    static let defaultRatio = "defaultRatio"
    static let preferredEquipment = "preferredEquipment"
    static let preferredCupType = "preferredCupType"
    static let timerAutoAdvance = "timerAutoAdvance"
    static let timeFormat = "timeFormat"
    static let textSizeScale = "textSizeScale"
    static let feelingLuckyFilter = "feelingLuckyFilter"
    static let hasLaunchedBefore = "hasLaunchedBefore"
    static let enableSounds = "enableSounds"
    static let enableAlerts = "enableAlerts"
    static let appTheme = "appTheme"
}

// MARK: - No-preference sentinel
let noPreference = ""

struct SettingsView: View {
    // Brew preferences
    @AppStorage(SettingsKeys.useMetricUnits) private var useMetricUnits = true
    @AppStorage(SettingsKeys.grinderType) private var grinderType = "Hand Grinder"
    @AppStorage(SettingsKeys.grinderCustom) private var grinderCustom = ""
    @AppStorage(SettingsKeys.defaultWaterTemp) private var defaultWaterTemp = noPreference
    @AppStorage(SettingsKeys.defaultRatio) private var defaultRatio = noPreference
    @AppStorage(SettingsKeys.preferredEquipment) private var preferredEquipment = noPreference
    @AppStorage(SettingsKeys.preferredCupType) private var preferredCupType = noPreference
    @AppStorage(SettingsKeys.timerAutoAdvance) private var timerAutoAdvance = true
    
    // Display & units
    @AppStorage(SettingsKeys.timeFormat) private var timeFormat = "seconds"
    @AppStorage(SettingsKeys.textSizeScale) private var textSizeScale = "default"
    
    // Onboarding
    @AppStorage(SettingsKeys.feelingLuckyFilter) private var feelingLuckyFilter = "all"
    
    // Experience
    @AppStorage(SettingsKeys.enableSounds) private var enableSounds = true
    @AppStorage(SettingsKeys.enableAlerts) private var enableAlerts = true
    @AppStorage(SettingsKeys.appTheme) private var appTheme = "System"
    
    let grinderOptions = ["Hand Grinder", "Flat Burr (Electric)", "Conical Burr (Electric)", "Blade Grinder", "Custom"]
    let themeOptions = ["System", "Light", "Dark"]
    let timeFormatOptions = ["Seconds (e.g. 90s)", "Minutes (e.g. 1:30)"]
    let timeFormatValues = ["seconds", "minsec"]
    let textSizeOptions = ["Default", "Large", "Extra Large"]
    let textSizeValues = ["default", "large", "extra"]
    let ratioOptions = ["1:14", "1:15", "1:16", "1:17", "1:18"]
    let feelingLuckyOptions = ["All recipes", "Favorites only", "Preferred equipment", "Preferred cup type"]
    let feelingLuckyValues = ["all", "favorites", "equipment", "cup"]
    
    @State private var showClearJournalAlert = false
    @State private var showClearBeansAlert = false
    @State private var showRestoreDefaultsAlert = false
    @State private var showExportSheet = false
    @State private var exportedURL: URL?
    @EnvironmentObject var data: RecipeData
    
    /// Bottom space so the last section (About & Support) isn't covered by the tab bar pill.
    private let bottomPillInset: CGFloat = 62
    
    var body: some View {
        Form {
            // MARK: Brew Preferences
            Section(header: Text("Brew Preferences")) {
                Picker("Units", selection: $useMetricUnits) {
                    Text("Metric (g/ml)").tag(true)
                    Text("Imperial (oz/°F)").tag(false)
                }
                .onChange(of: useMetricUnits) { _ in Haptics.selection() }
                
                Picker("Grinder Type", selection: $grinderType) {
                    ForEach(grinderOptions, id: \.self) { type in
                        Text(type).tag(type)
                    }
                }
                .onChange(of: grinderType) { _ in Haptics.selection() }
                if grinderType == "Custom" {
                    TextField("Your grinder name", text: $grinderCustom)
                }
                
                Picker("Default Water Temperature", selection: $defaultWaterTemp) {
                    Text("No preference").tag(noPreference)
                    ForEach([85, 88, 90, 92, 95, 96], id: \.self) { temp in
                        Text("\(temp)°C").tag("\(temp)")
                    }
                }
                .onChange(of: defaultWaterTemp) { _ in Haptics.selection() }
                
                Picker("Default Ratio", selection: $defaultRatio) {
                    Text("No preference").tag(noPreference)
                    ForEach(ratioOptions, id: \.self) { ratio in
                        Text(ratio).tag(ratio)
                    }
                }
                .onChange(of: defaultRatio) { _ in Haptics.selection() }
                
                Picker("Preferred Equipment", selection: $preferredEquipment) {
                    Text("No preference").tag(noPreference)
                    ForEach(AeroPressEquipment.allCases) { eq in
                        Text(eq.rawValue).tag(eq.rawValue)
                    }
                }
                .onChange(of: preferredEquipment) { _ in Haptics.selection() }
                
                Picker("Preferred Cup Type", selection: $preferredCupType) {
                    Text("No preference").tag(noPreference)
                    ForEach(CupType.allCases) { ct in
                        Text(ct.rawValue).tag(ct.rawValue)
                    }
                }
                .onChange(of: preferredCupType) { _ in Haptics.selection() }
                
                Toggle("Timer: Auto-advance steps", isOn: $timerAutoAdvance)
                    .onChange(of: timerAutoAdvance) { _ in Haptics.lightImpact() }
            }
            
            // MARK: Display & Units
            Section(header: Text("Display & Units")) {
                Picker("Time Format", selection: $timeFormat) {
                    ForEach(Array(timeFormatOptions.enumerated()), id: \.offset) { i, label in
                        Text(label).tag(timeFormatValues[i])
                    }
                }
                .onChange(of: timeFormat) { _ in Haptics.selection() }
                
                Picker("Text Size", selection: $textSizeScale) {
                    ForEach(Array(textSizeOptions.enumerated()), id: \.offset) { i, label in
                        Text(label).tag(textSizeValues[i])
                    }
                }
                .onChange(of: textSizeScale) { _ in Haptics.selection() }
            }
            
            // MARK: Journal & Data
            Section(header: Text("Journal & Data")) {
                Button("Export Journal") {
                    exportJournal()
                }
                .disabled(data.journalEntries.isEmpty)
                
                Button("Clear Brew Journal", role: .destructive) {
                    showClearJournalAlert = true
                }
                .disabled(data.journalEntries.isEmpty)
                
                Button("Clear Beans", role: .destructive) {
                    showClearBeansAlert = true
                }
                .disabled(data.beans.isEmpty)
            }
            
            Section(header: Text("Data & Privacy")) {
                Text("All data (recipes, journal, beans) is stored only on this device. Nothing is sent to external servers.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            // MARK: Onboarding
            Section(header: Text("Onboarding")) {
                Picker("I'm Feeling Lucky", selection: $feelingLuckyFilter) {
                    ForEach(Array(feelingLuckyOptions.enumerated()), id: \.offset) { i, label in
                        Text(label).tag(feelingLuckyValues[i])
                    }
                }
                .onChange(of: feelingLuckyFilter) { _ in Haptics.selection() }
                
                Button("Restore First-Launch Defaults") {
                    showRestoreDefaultsAlert = true
                }
            }
            
            // MARK: Experience
            Section(header: Text("Experience")) {
                Toggle("Brew Sounds", isOn: $enableSounds)
                    .onChange(of: enableSounds) { _ in Haptics.lightImpact() }
                Toggle("Timer Alerts", isOn: $enableAlerts)
                    .onChange(of: enableAlerts) { _ in Haptics.lightImpact() }
                
                Picker("Appearance", selection: $appTheme) {
                    ForEach(themeOptions, id: \.self) { theme in
                        Text(theme).tag(theme)
                    }
                }
                .onChange(of: appTheme) { _ in Haptics.selection() }
            }
            
            // MARK: About & Support
            Section(header: Text("About & Support")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }
                
                Link("Contact Me", destination: URL(string: "mailto:jamesli2027@u.northwestern.edu")!)
                
                NavigationLink("Acknowledgements") {
                    AcknowledgementsView()
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: bottomPillInset)
        }
        .alert("Clear Brew Journal?", isPresented: $showClearJournalAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Clear", role: .destructive) {
                data.journalEntries.removeAll()
            }
        } message: {
            Text("This cannot be undone. All brew log entries will be deleted.")
        }
        .alert("Clear Beans?", isPresented: $showClearBeansAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Clear", role: .destructive) {
                data.beans.removeAll()
            }
        } message: {
            Text("This cannot be undone. All logged beans will be deleted.")
        }
        .alert("Restore Defaults?", isPresented: $showRestoreDefaultsAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Restore") {
                restoreFirstLaunchDefaults()
            }
        } message: {
            Text("Reset all settings to first-launch defaults. Your recipes, journal, and beans are not affected.")
        }
        .sheet(isPresented: $showExportSheet) {
            if let url = exportedURL {
                ShareSheet(items: [url])
            }
        }
    }
    
    private func exportJournal() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        var csv = "Date,Recipe,Bean,Rating,Notes\n"
        for entry in data.journalEntries {
            let dateStr = formatter.string(from: entry.date)
            let notesEscaped = entry.notes.replacingOccurrences(of: "\"", with: "\"\"")
            let ratingStr = entry.rating.map { "\($0)" } ?? ""
            csv += "\"\(dateStr)\",\"\(entry.recipeName)\",\"\(entry.beanName)\",\"\(ratingStr)\",\"\(notesEscaped)\"\n"
        }
        let tempDir = FileManager.default.temporaryDirectory
        let fileName = "brew_journal_\(formatter.string(from: Date()).replacingOccurrences(of: " ", with: "_")).csv"
        let fileURL = tempDir.appendingPathComponent(fileName)
        try? csv.write(to: fileURL, atomically: true, encoding: .utf8)
        exportedURL = fileURL
        showExportSheet = true
    }
    
    private func restoreFirstLaunchDefaults() {
        useMetricUnits = true
        grinderType = "Hand Grinder"
        grinderCustom = ""
        defaultWaterTemp = noPreference
        defaultRatio = noPreference
        preferredEquipment = noPreference
        preferredCupType = noPreference
        timerAutoAdvance = true
        timeFormat = "seconds"
        textSizeScale = "default"
        feelingLuckyFilter = "all"
        enableSounds = true
        enableAlerts = true
        appTheme = "System"
    }
}

// MARK: - Share Sheet (export)
struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Acknowledgements
struct AcknowledgementsView: View {
    private let bottomPillInset: CGFloat = 62
    
    var body: some View {
        List {
            Section(header: Text("Recipes")) {
                Text("Recipe data includes World AeroPress Championship (WAC) and community recipes.")
            }
            Section(header: Text("Assets")) {
                Text("Icons and imagery used in this app are from the project or system assets.")
            }
        }
        .navigationTitle("Acknowledgements")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: bottomPillInset)
        }
    }
}
