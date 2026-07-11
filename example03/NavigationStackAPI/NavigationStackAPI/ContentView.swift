import SwiftUI

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct CustomerView: View {
    let customer: Customer
    
    var body: some View {
        VStack {
            Text(customer.name)
        }
    }
}

struct ContentView: View {
    
    let customers = [
        Customer(name: "John"),
        Customer(name: "Mary"),
        Customer(name: "Steven"),
    ]
    
    var body: some View {
        NavigationStack {
            List(customers) { customer in
                NavigationLink(customer.name, value: customer)
            }
            .navigationDestination(for: Customer.self, destination: { customer in
                CustomerView(customer: customer)
            })
            .listStyle(.plain)
            .navigationTitle("List")
        }
    }
}

#Preview {
    ContentView()
}
