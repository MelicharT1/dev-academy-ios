//
//  PlaceDetailViewState.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import Foundation
import SwiftUI
import MapKit

struct PlaceDetailViewState: DynamicProperty {
    @EnvironmentObject private var placesObservable: PlacesObservableObject
    
    let place: Place
    
    var isFavorite: Binding<Bool> {
        Binding(
            get: { placesObservable.isFavorite(place: place) },
            set: { newValue in
                placesObservable.set(place: place, favorite: newValue)
            }
        )
    }
    
    init(place: Place) {
        self.place = place
    }
    
    /// Map coordinate
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: place.geometry?.latitude ?? 0, longitude: place.geometry?.longitude ?? 0)
    }
    
    /// Map span
    var span: MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    }
}
