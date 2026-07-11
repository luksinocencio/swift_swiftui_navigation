import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Cadastro")
            TextField("Nome", text: .constant(""))
            TextField("Email", text: .constant(""))
            SecureField("Senha", text: .constant(""))
        }
        .padding()
        .navigationTitle("Sign Up")
    }
}

//#Preview {
//    LoginView(router: <#T##arg#>, nickname: "Lucas")
//}
