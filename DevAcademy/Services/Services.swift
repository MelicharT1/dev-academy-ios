//
//  Services.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import Foundation

final class Services {
    let placesService: PlacesService
    let userLocationService: UserLocationService

    init(
        placesService: PlacesService = ProductionPlacesService(),
        userLocationService: UserLocationService = ProductionUserLocationService()
    ) {
        self.placesService = placesService
        self.userLocationService = userLocationService
    }
}

// MARK: - Mock
extension Services {
    static let mock = Services(placesService: MockPlacesService(), userLocationService: MockLocationService())
}
