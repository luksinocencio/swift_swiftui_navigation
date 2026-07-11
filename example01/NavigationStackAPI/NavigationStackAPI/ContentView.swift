import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailsView()
            } label: {
                HStack {
                    Image(systemName: "heart")
                    Text("heart")
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
