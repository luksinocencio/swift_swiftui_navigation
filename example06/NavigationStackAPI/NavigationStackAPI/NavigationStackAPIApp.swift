import SwiftUI

enum Route: Hashable {
    case home
    case detail(Customer)
}

@Observable
class NavigationState {
    var routes: [Route] = []
}

@main
struct NavigationStackAPIApp: App {
    @State private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .home:
                            Text("Tela Home")
                        case .detail(let customer):
                            Text("Detail: \(customer.name)")
                        }
                    }
            }
            .environment(navigationState)
        }
    }
}
