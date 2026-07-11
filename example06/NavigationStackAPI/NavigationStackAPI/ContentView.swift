import SwiftUI

struct Customer: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct CustomerDetailView: View {
    var customer: Customer
    
    var body: some View {
        Text("Detail: \(customer.name)")
            .navigationTitle(customer.name)
    }
}

struct ContentView: View {
    @Environment(NavigationState.self) private var navigationState
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Ir para Home") {
                navigationState.routes.append(.home)
            }
            
            Button("Ir para Detalhes") {
                let customer = Customer(name: "João Silva")
                navigationState.routes.append(.detail(customer))
            }
        }
        .navigationTitle("Tela Inicial")
    }
}

#Preview {
    ContentView()
        .environment(NavigationState())
}
