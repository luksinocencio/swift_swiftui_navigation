import Observation

@Observable
final class AppRouter {
    enum Flow {
        case authentication
        case main
    }
    
    var flow: Flow = .authentication
    var nickname = ""
    
    func login(_ nickname: String) {
        self.nickname = nickname
        flow = .main
    }
    
    func logout() {
        nickname = ""
        flow = .authentication
    }
}
