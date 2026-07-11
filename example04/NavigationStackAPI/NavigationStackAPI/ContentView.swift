import SwiftUI

struct ContentView: View {
    @State private var numbers: [Int] = [2, 3]
    
    var body: some View {
        NavigationStack(path: $numbers) {
            VStack { // Adicionamos um VStack para agrupar os botões
                Button("Navigation") {
                    numbers.append(99)
                }
                
                Button("Random Number") {
                    let randomInt = Int.random(in: 0...100)
                    numbers.append(randomInt)
                }
            }
            // O destino fica atrelado ao conteúdo de dentro do Stack
            .navigationDestination(for: Int.self) { value in
                Text("\(value)")
            }
        }
    }
}

#Preview {
    ContentView()
}
