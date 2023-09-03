//
//  PlacesSceneViewState.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

struct PlacesSceneViewState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    @State var showFavorites: Bool = false
    
    let navigationTitle: String = "Kultůrmapa"
    
    var isPlaceEmpty: Bool {
        !places.isEmpty
    }
    
    var places: [Place] {
        placesObject.places
    }
    
    var favorites: [Place] {
        placesObject.places.filter { place in
            if let favoritePlaces = placesObject.favorites {
                return favoritePlaces.contains {$0 == place.attributes.ogcFid }
            }
            return false
        }
    }
    
    func favoritePressed() {
        showFavorites.toggle()
    }
    
    func fetch() {
        placesObject.fetchData()
    }
    
    func fetchWithAsync() async {
        await placesObject.placesWithAsync()
    }
}
