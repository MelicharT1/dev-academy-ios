//
//  IdentifiableCoordinate.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 22.08.2023.
//

import MapKit

/// IdentifiableCoordinate for Map - `annotationItems`
struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
