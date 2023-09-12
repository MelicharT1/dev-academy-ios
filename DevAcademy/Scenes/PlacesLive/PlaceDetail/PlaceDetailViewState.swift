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
    var coordinate: CLLocationCoordinate2D? {
        place.geometry.map {
            CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
        }
    }
    
    /// Map span
    var span: MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    }
    
    func didTapCall() {
        if let phone = place.attributes.phoneNumber {
            URL.didTapCall(number: phone)
        }
    }
    
    func didTapOpenLink() {
        if let website = place.attributes.website, let url = URL(string: website) {
            URL.didTapOpenLink(for: url)
        }
    }
    
    func didTapOpenNavigation() {
        guard let coordinate = coordinate else { return }
        
        URL.didTapOpenNavigation(for: coordinate)
    }
}
