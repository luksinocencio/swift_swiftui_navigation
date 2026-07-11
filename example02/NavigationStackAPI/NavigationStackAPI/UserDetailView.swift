import SwiftUI

struct User: Hashable {
    let name: String
    let email: String
    let age: Int
}

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("Details View")
                .font(.largeTitle)
            Text(user.name)
            Text(user.email)
            Text("\(user.age)")
        }
    }
}

#Preview {
    let user = User(name: "Lucas", email: "lucas@mail.com", age: 32)
    UserDetailView(user: user)
}
