import SwiftUI

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct CustomerDetailView: View {
    let customer: Customer
    
    var body: some View {
        Text("Hello \(customer.name)!")
    }
}

struct ContentView: View {
    @Environment(NavigationState.self) private var navigationState

    
    var body: some View {
        VStack {
            Button("Customer Detail") {
                navigationState.routes.append(Customer(name: "Steven Smith!"))
            }
            Button("Int") {
                navigationState.routes.append(99)
            }
            .navigationTitle("Home")
        }
    }
}

struct ContentViewContainer: View {
    @State private var navigationState = NavigationState()
    
    var body: some View {
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

#Preview {
    NavigationStack {
        ContentViewContainer()
    }
}
