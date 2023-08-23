import SwiftUI

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct CustomerDetailView: View {
    let customer: Customer
    
    var body: some View {
        Text("\(customer.name)")
    }
}

struct ContentView: View {
    @EnvironmentObject private var navigationState: NavigationState
    
    var body: some View {
        VStack {
            Button("Costumer Detail") {
                navigationState.routes.append(Customer(name: "Steven Smith"))
            }
            
            Button("Int Detail") {
                navigationState.routes.append(99)
            }
        }
    }
}

struct ContentViewContainer: View {
    @StateObject private var navigationState = NavigationState()
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            ContentView()
                .environmentObject(navigationState)
                .navigationDestination(for: Customer.self) { customer in
                    CustomerDetailView(customer: customer)
                }
                .navigationDestination(for: Int.self) { value in
                    Text("\(value)")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewContainer()
    }
}
