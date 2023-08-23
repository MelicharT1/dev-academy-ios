//
//  Services.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import Foundation

final class Services {
    let placesService: PlacesService

    init(placesService: PlacesService = ProductionPlacesService()) {
        self.placesService = placesService
    }
}

// MARK: - Mock
extension Services {
    static let mock = Services(placesService: MockPlacesService())
}
