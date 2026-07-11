import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    ContentView()
}
