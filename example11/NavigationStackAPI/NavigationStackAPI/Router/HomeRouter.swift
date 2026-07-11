import SwiftUI
import Observation

@Observable
final class HomeRouter {
    enum Route: Hashable {
        case profile
    }
    
    var path = NavigationPath()
    
    func goToProfile() {
        path.append(Route.profile)
    }
}
