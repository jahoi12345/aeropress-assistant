import Foundation

/// Format values for display based on user's unit preference.
enum DisplayHelpers {
    private static let gramsPerOz = 28.35
    
    static func formatCoffee(_ grams: Double, metric: Bool) -> String {
        metric ? "\(Int(grams))g" : String(format: "%.1f oz", grams / gramsPerOz)
    }
    
    static func formatWater(_ grams: Double?, metric: Bool) -> String {
        guard let g = grams else { return "N/A" }
        return metric ? "\(Int(g))g" : String(format: "%.1f oz", g / gramsPerOz)
    }
    
    static func formatTemp(_ celsius: Int?, metric: Bool) -> String {
        guard let c = celsius else { return "N/A" }
        if metric { return "\(c)°C" }
        let f = Int(Double(c) * 9/5 + 32)
        return "\(f)°F"
    }
    
    static func formatDuration(seconds: Int, timeFormatMinSec: Bool) -> String {
        if timeFormatMinSec {
            let m = seconds / 60
            let s = seconds % 60
            return m > 0 ? "\(m):\(String(format: "%02d", s))" : "\(seconds)s"
        }
        return "\(seconds)s"
    }
}
