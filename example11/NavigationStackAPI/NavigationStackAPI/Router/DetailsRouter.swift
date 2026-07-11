import SwiftUI
import Observation

@Observable
final class DetailsRouter {
    enum Route: Hashable {
        case detail(Int)
    }
    
    var path = NavigationPath()
    
    func showDetail(id: Int) {
        path.append(Route.detail(id))
    }
}
