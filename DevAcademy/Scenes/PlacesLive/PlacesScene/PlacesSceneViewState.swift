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
    
    func favoritePressed() {
        showFavorites.toggle()
    }
    
    func fetch() {
        placesObject.fetchData()
    }
}
