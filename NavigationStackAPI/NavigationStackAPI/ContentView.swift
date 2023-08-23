import SwiftUI

struct CustomCostumerView: View {
    let costumer: Costumer
    
    var body: some View {
        Text(costumer.name)
            .navigationTitle("\(costumer.id)")
    }
}

struct Costumer: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    let costumers = [
        Costumer(name: "John"),
        Costumer(name: "Mary"),
        Costumer(name: "Steven")
    ]
    
    var body: some View {
        NavigationStack {
            List(costumers) { costumer in
                NavigationLink(costumer.name, value: costumer)
            }.navigationDestination(for: Costumer.self, destination: { costumer in
                CustomCostumerView(costumer: costumer)
            })
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

