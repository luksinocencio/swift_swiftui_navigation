import SwiftUI

struct HomeView: View {
    
    @Environment(AppRouter.self)
    private var appRouter
    
    let router: HomeRouter
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Olá \(appRouter.nickname)")
            
            Button("Abrir Perfil") {
                router.goToProfile()
            }
            
            Button("Logout") {
                appRouter.logout()
            }
        }
        .navigationTitle("Home")
        .navigationDestination(for: HomeRouter.Route.self) { route in
            
            switch route {
                
            case .profile:
                ProfileView()
            }
        }
    }
}
