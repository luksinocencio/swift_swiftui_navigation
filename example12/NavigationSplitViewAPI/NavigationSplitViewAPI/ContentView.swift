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

struct Movie: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let genre: Genre
    
}

struct MovieListView: View {
    
    let genre: Genre
    @Binding var selectedMovie: Movie?
    
    let movies = [Movie(name: "Superman", genre: .action), Movie(name: "28 Days Later", genre: .horror), Movie(name: "World War Z", genre: .horror),Movie(name: "Finding Nemo", genre: .kids)]
    
    private var filteredMovies: [Movie] {
        movies.filter { $0.genre == genre }
    }
    
    var body: some View {
        List(filteredMovies, selection: $selectedMovie) { movie in
            NavigationLink(movie.name, value: movie)
        }
    }
    
}

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        Text(movie.name)
    }
}


struct ContentView: View {
    
    @State private var selectedGenre: Genre? = .action
    @State private var selectedMovie: Movie?
    
    var body: some View {
        NavigationSplitView {
            GenreListView(selectedGenre: $selectedGenre)
        } content: {
            MovieListView(genre: selectedGenre ?? .action, selectedMovie: $selectedMovie)
        } detail: {
            if let selectedMovie {
                MovieDetailView(movie: selectedMovie)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
