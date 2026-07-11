import SwiftUI

struct MainTabView: View {
    
    @State private var homeRouter = HomeRouter()
    @State private var detailsRouter = DetailsRouter()
    
    var body: some View {
        
        TabView {
            
            NavigationStack(path: $homeRouter.path) {
                
                HomeView(router: homeRouter)
                
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack(path: $detailsRouter.path) {
                
                DetailsView(router: detailsRouter)
                
            }
            .tabItem {
                Label("Detalhes", systemImage: "list.bullet")
            }
        }
    }
}
