import SwiftUI


@Observable class NavigationState {
    var routes = NavigationPath()
}

@main
struct NavigationStackAPIApp: App {
    
    @State private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .environment(navigationState)
                    .navigationDestination(for: Customer.self) { customer in
                        CustomerDetailView(customer: customer)
                    }
                    .navigationDestination(for: Int.self) { value in
                        Text("\(value)")
                    }
            }
        }
    }
}
