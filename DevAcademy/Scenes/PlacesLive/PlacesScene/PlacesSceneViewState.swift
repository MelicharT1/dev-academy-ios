//
//  PlacesSceneViewState.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI
import MapKit

struct PlacesSceneViewState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    @State var showFavorites: Bool = false
    
    let navigationTitle: String = Localization.ViewTitles.menuTitle
    
    /// CLLocationCoordinate2D of all places
    var placesCoordinator: [IdentifiableCoordinate] {
        places.compactMap {
            IdentifiableCoordinate(
                coordinate: CLLocationCoordinate2D(
                    latitude: $0.geometry?.latitude ?? 0,
                    longitude: $0.geometry?.longitude ?? 0
                )
            )
        }
    }
    
    /// Map coordinate
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 49.195060, longitude: 16.606837)
    }
    
    /// Map span
    var span: MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    }
    
    var isPlaceEmpty: Bool {
        !places.isEmpty
    }
    
    var places: [Place] {
        placesObject.places
    }
    
    func favoritePressed() {
        showFavorites.toggle()
    }
    
    func settingsPressed() {
        
    }
    
    func fetch() {
        placesObject.fetchData()
    }
    
    func fetchWithAsync() async {
        await placesObject.placesWithAsync()
    }
}
