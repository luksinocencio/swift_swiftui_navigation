import SwiftUI

enum Genre: String, Hashable, CaseIterable {
    case action = "Action"
    case horror = "Horror"
    case fiction = "Fiction"
    case kids = "Kids"
}

struct GenreListView: View {
    @Binding var selectedGenre: Genre?
    
    var body: some View {
        List(Genre.allCases, id: \.self, selection: $selectedGenre) { genre in
            Text(genre.rawValue)
        }
    }
}

struct GenreDetailView: View {
    let genre: Genre
    
    var body: some View {
        Text(genre.rawValue)
            .font(.system(size: 100))
    }
}

struct ContentView: View {
    @State private var selectedGenre: Genre? = .action
    
    var body: some View {
        NavigationSplitView {
            GenreListView(selectedGenre: $selectedGenre)
        } detail: {
            GenreDetailView(genre: selectedGenre ?? .action)
        }
        
    }
}

#Preview {
    ContentView()
}
