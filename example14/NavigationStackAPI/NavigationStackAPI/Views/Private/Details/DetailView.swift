import SwiftUI

struct DetailView: View {
    
    let id: Int
    
    var body: some View {
        
        Text("Detalhe \(id)")
            .navigationTitle("Item \(id)")
    }
}
