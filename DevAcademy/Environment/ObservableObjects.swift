//
//  ObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//


import Foundation

final class ObservableObjects {
    let places: PlacesObservableObject

    init(places: PlacesObservableObject = PlacesObservableObject(
        placesService: ProductionPlacesService(),
        userLocationService: ProductionUserLocationService()
    )) {
        self.places = places
    }
}

// MARK: - Mock
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects()
}
