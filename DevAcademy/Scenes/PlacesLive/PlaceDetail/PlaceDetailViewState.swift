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
    let place: Place
    
    init(place: Place) {
        self.place = place
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: place.geometry.latitude, longitude: place.geometry.longitude)
    }
}
