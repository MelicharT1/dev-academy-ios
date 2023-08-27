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
    
    /// FavoriteScene
    var favoriteScene: some View {
        Text("ouuuu.. něco tu chybí")
    }
    
    /// Settings
    var settingScene: some View {
        SettingsView()
    }
}

// MARK: - Make Views with parameter (func)
extension Coordinator {
    func makeDetailView(for place: Place) -> some View {
        PlaceDetailView(viewState: .init(place: place, mapService: MapService()))
    }
    
    func setting() -> some View {
        SettingsView()
    }
}
