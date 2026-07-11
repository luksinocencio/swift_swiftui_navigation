import SwiftUI

struct AppView: View {
    @Environment(AppRouter.self)
    private var appRouter
    
    @State private var authRouter = AuthRouter()
    
    var body: some View {
        
        switch appRouter.flow {
        case .authentication:
            NavigationStack(path: $authRouter.path) {
                LoginView(router: authRouter)
                    .navigationDestination(for: AuthRouter.Route.self) { route in
                        switch route {
                        case .signup:
                            SignUpView()
                        }
                    }
            }
        case .main:
            MainTabView()
        }
    }
}
