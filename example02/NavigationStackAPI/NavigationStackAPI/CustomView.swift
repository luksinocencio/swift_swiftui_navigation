import SwiftUI

struct CustomView: View {
    let name: String
    
    var body: some View {
        VStack {
            Text(name)
        }
    }
}

#Preview {
    CustomView(name: "Lucas")
}
