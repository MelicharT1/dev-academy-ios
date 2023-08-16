//
//  MockPlacesService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 16.08.2023.
//

import Foundation

// MARK: - MockPlacesService
final class MockPlacesService: PlacesService {
    /// With async await
    func placesWithAsync() async throws -> Places {
        Places.mock
    }
    
    func places(_ completion: @escaping (Result<Places, Error>) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            let data = Places.mock
            completion(.success(data))
        }
    }
}
