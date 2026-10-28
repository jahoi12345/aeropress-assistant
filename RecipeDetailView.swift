import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var data: RecipeData
    @AppStorage(SettingsKeys.useMetricUnits) private var useMetricUnits = true
    @AppStorage(SettingsKeys.timeFormat) private var timeFormat = "seconds"
    let recipe: Recipe
    
    /// Bottom space so content (e.g. Start Brewing button) isn't covered by the tab bar pill.
    private let bottomPillInset: CGFloat = 62

    var isFavorite: Bool {
        data.recipes.first(where: { $0.id == recipe.id })?.isFavorite ?? false
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Author & Championship
                if let author = recipe.author {
                    HStack(spacing: 4) {
                        Text("by \(author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        if let year = recipe.competitionYear {
                            Text("· WAC \(year)")
                                .font(.subheadline)
                                .foregroundColor(.brown)
                        }
                        if let placement = recipe.placement {
                            Text(placement == 1 ? "🥇" : placement == 2 ? "🥈" : "🥉")
                                .font(.subheadline)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Core Facts
                HStack(spacing: 20) {
                    DetailFactItem(title: "Equipment", value: recipe.equipment.rawValue, highlightAeroPress: true)
                    DetailFactItem(title: "Cup", value: recipe.cupTypes.map { $0.rawValue }.joined(separator: ", "))
                }
                .padding(.horizontal)
                
                HStack(spacing: 20) {
                    DetailFactItem(title: "Coffee", value: DisplayHelpers.formatCoffee(recipe.coffeeAmountGrams, metric: useMetricUnits))
                    DetailFactItem(title: "Water", value: DisplayHelpers.formatWater(recipe.waterAmountGrams, metric: useMetricUnits))
                    DetailFactItem(title: "Ratio", value: recipe.ratio)
                    DetailFactItem(title: "Temp", value: DisplayHelpers.formatTemp(recipe.waterTemperatureCelsius, metric: useMetricUnits))
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                
                // Brew Method
                if let method = recipe.brewMethod {
                    HStack {
                        Image(systemName: method == .inverted ? "arrow.down" : "arrow.up")
                            .foregroundColor(.brown)
                        Text(method.rawValue)
                    }
                    .font(.subheadline)
                }
                
                // Bypass water
                if let bypassGrams = recipe.bypassWaterGrams {
                    HStack {
                        Image(systemName: "drop.triangle")
                            .foregroundColor(.blue)
                        if let bypassTemp = recipe.bypassWaterTempCelsius {
                            Text("Bypass: \(DisplayHelpers.formatWater(recipe.bypassWaterGrams, metric: useMetricUnits)) at \(DisplayHelpers.formatTemp(recipe.bypassWaterTempCelsius, metric: useMetricUnits))")
                        } else {
                            Text("Bypass: \(DisplayHelpers.formatWater(recipe.bypassWaterGrams, metric: useMetricUnits))")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                // Grind
                if let grind = recipe.grindDescription {
                    (Text("Grind: ") + AeroPressHighlight.text(grind))
                        .font(.headline)
                }
                
                // Filter setup
                if let filter = recipe.filterNotes {
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.brown)
                        AeroPressHighlight.text(filter)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                // Bean summary
                if let beanSummary = recipe.beanSummary {
                    HStack {
                        Image(systemName: "leaf")
                            .foregroundColor(.brown)
                        AeroPressHighlight.text(beanSummary)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                
                // Steps
                Text("Steps")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                    HStack {
                        Text("\(index + 1)")
                            .font(.headline)
                            .frame(width: 30, height: 30)
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            HStack {
                                AeroPressHighlight.text(step.title)
                                    .font(.headline)
                                Text(step.action.rawValue)
                                    .font(.caption2)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(Color.brown.opacity(0.12))
                                    .foregroundColor(.brown)
                                    .cornerRadius(4)
                            }
                            if let desc = step.description {
                                AeroPressHighlight.text(desc)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        Spacer()
                        
                        if step.durationSeconds > 0 {
                            Text(DisplayHelpers.formatDuration(seconds: step.durationSeconds, timeFormatMinSec: timeFormat == "minsec"))
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.vertical, 4)
                }
                
                Spacer(minLength: 40)
                
                // Start Button (pill: same height and radius as nav bar pill)
                NavigationLink(destination: ActiveBrewView(recipe: recipe)) {
                    Text("Start Brewing")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.brown)
                        .clipShape(Capsule())
                }
                .simultaneousGesture(TapGesture().onEnded { Haptics.selection() })
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: bottomPillInset)
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                AeroPressHighlight.text(recipe.name)
                    .font(.headline)
                    .lineLimit(1)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    Haptics.selection()
                    if let idx = data.recipes.firstIndex(where: { $0.id == recipe.id }) {
                        data.recipes[idx].isFavorite.toggle()
                    }
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .foregroundColor(isFavorite ? .yellow : .gray)
                }
            }
        }
    }
}

struct DetailFactItem: View {
    let title: String
    let value: String
    var highlightAeroPress: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            Group {
                if highlightAeroPress {
                    AeroPressHighlight.text(value)
                } else {
                    Text(value)
                }
            }
            .font(.headline)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}
