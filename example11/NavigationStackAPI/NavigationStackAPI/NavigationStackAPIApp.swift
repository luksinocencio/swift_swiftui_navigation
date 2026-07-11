import SwiftUI

@main
struct NavigationStackAPIApp: App {
    @State private var appRouter = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environment(appRouter)
        }
    }
}
