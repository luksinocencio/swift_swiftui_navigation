import SwiftUI

struct DetailView: View {
    let value: Int
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
            Text("\(value)")
                .foregroundColor(.white)
                .font(Font.body)
                .fontWeight(.bold)
                .navigationTitle("Details")
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink("DetailView", value: 99)
                .navigationDestination(for: Int.self) { value in
                    DetailView(value: value)
                }
            
            NavigationLink {
                DetailView(value: 130)
            } label: {
                //                Text("Detail")
                Image(systemName: "heart.fill")
                    .frame(width: 44, height: 44)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
