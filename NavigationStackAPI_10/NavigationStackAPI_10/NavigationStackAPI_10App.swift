import SwiftUI

enum Route: Hashable {
    case home
    case detail(Customer)
}

class NavigationState: ObservableObject {
    @Published var routes: [Route] = []
}

@main
struct NavigationStackAPI_10App: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .environmentObject(navigationState)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                            case .home:
                                Text("Home")
                            case .detail(let costumer):
                                Text(costumer.name)
                        }
                    }
            }
        }
    }
}
