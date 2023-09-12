//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

/// `Coordinator` as Factory
final class Coordinator: ObservableObject {
    /// PlacesScene
    var placesScene: some View {
        PlacesSceneView()
    }
}

// MARK: - Make Views with parameter (func)
extension Coordinator {
    func makeDetailView(for place: Place) -> some View {
        PlaceDetailView(viewState: .init(place: place))
    }
    
    func setting() -> some View {
        SettingsView()
    }
    /// FavoriteScene
    func favoriteScene(places: [Place]) -> some View {
        FavoriteSceneView(viewState: .init(places: places))
    }
}
