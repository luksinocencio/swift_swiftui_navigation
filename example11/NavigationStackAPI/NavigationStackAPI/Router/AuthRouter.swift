import SwiftUI
import Observation

@Observable
final class AuthRouter {
    
    enum Route: Hashable {
        case signup
    }
    
    var path = NavigationPath()
    
    func goToSignUp() {
        path.append(Route.signup)
    }
    
    func back() {
        path.removeLast()
    }
}
