import SwiftUI

struct DetailsView: View {
    
    let router: DetailsRouter
    
    var body: some View {
        
        VStack {
            
            Button("Detalhe 1") {
                router.showDetail(id: 1)
            }
            
            Button("Detalhe 2") {
                router.showDetail(id: 2)
            }
            
        }
        .navigationTitle("Detalhes")
        .navigationDestination(for: DetailsRouter.Route.self) { route in
            
            switch route {
                
            case .detail(let id):
                DetailView(id: id)
            }
        }
    }
}
