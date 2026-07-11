import SwiftUI

struct ContentView: View {
    let user = User(name: "Lucas", email: "lucas@mail.com", age: 32)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationLink("User Detail", value: user)
                NavigationLink("Name", value: "Lucas")
            }   
            .navigationDestination(for: User.self, destination: { value in
                UserDetailView(user: value)
            })
            .navigationDestination(for: String.self, destination: { value in
                CustomView(name: value)
            })
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
