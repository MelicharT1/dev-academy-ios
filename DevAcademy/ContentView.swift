import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            firstTab
            secondTab
        }
    }
    
    private var firstTab: some View {
        PlacesScene()
            .tabItem {
                Label("MAPA", systemImage: "fireplace")
            }
    }
    
    private var secondTab: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Ahoooj")
        }
        .tabItem {
            Label("COLOR", systemImage: "paintpalette")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
