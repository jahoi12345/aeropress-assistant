import SwiftUI

@main
struct MyApp: App {
    @StateObject private var recipeData = RecipeData()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(recipeData)
        }
    }
}
