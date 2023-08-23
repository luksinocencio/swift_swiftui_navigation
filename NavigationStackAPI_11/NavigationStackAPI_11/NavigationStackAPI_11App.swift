import SwiftUI

class NavigationState: ObservableObject {
    @Published var routes = NavigationPath()
}

@main
struct NavigationStackAPI_11App: App {
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                ContentView()
                    .environmentObject(navigationState)
                    .navigationDestination(for: Customer.self) { costumer in
                        CustomerDetailView(customer: costumer)
                    }
                    .navigationDestination(for: Int.self) { value in
                        Text("\(value)")
                    }
            }
        }
    }
}
