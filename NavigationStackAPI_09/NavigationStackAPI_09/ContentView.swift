import SwiftUI

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

enum Route: Hashable {
    case home
    case detail(Customer)
}

struct CustomerDetailView: View {
    var body: some View {
        Text("CustomerDetailView")
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
                    routes.append(.detail(Customer(name: "John Doe")))
                }
            }.navigationDestination(for: Route.self) { route in
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
