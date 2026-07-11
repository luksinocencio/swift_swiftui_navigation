import SwiftUI

struct LoginView: View {
    
    let router: AuthRouter
    @Environment(AppRouter.self)
    private var appRouter
    
    @State private var nickname = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            TextField("Nickname", text: $nickname)
                .textFieldStyle(.roundedBorder)
            
            Button("Entrar") {
                appRouter.login(nickname)
            }
            
            Button("Criar conta") {
                router.goToSignUp()
            }
            
        }
        .padding()
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView(router: AuthRouter())
        .environment(AppRouter())
}
