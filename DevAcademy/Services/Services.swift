//
//  Services.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import Foundation

final class Services {
    let dataService: DataService

    init(dataService: DataService = DataService.shared) {
        self.dataService = dataService
    }
}

// MARK: - Mock
extension Services {
    static let mock = Services(dataService: DataService.shared)
}
