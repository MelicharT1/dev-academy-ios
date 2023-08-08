//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

final class Coordinator: ObservableObject {
    /// PlacesScene
    var placesScene: some View {
        PlacesSceneView()
    }
    
    /// FavoriteScene
    var favoriteScene: some View {
        Text("ouuuu.. něco tu chybí")
    }
}

// MARK: - Make Views with parameter (func)
extension Coordinator {
    func makeDetailView(for place: Place) -> some View {
        PlaceDetailView(viewState: .init(place: place))
    }
}
