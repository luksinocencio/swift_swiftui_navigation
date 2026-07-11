import SwiftUI

struct Customer: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

enum Route: Hashable {
    case home
    case detail(Customer)
}

struct CustomerDetailView: View {
    var customer: Customer
    
    var body: some View {
        Text("Detail: \(customer.name)")
    }
}

struct ContentView: View {
    @State private var routes: [Route] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                Button("Home") {
                    routes.append(.home)
                }
                
                Button("Detail") {
                    let customer = Customer(name: "Foo")
                    routes.append(.detail(customer))
                }
            }.navigationDestination(for: Route.self) { route in
                switch route {
                    case .home:
                        Text("Home")
                    case .detail(let customer):
                        Text("Detail: \(customer.name)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
