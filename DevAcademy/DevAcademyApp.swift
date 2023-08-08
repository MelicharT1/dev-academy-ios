import SwiftUI

@main
struct DevAcademyApp: App {
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .inject(objects: ObservableObjects(), coordinator: Coordinator())
        }
    }
}
