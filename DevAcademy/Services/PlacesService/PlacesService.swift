//
//  DataService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

protocol PlacesService {
    // 1. Clousure
    func places(_ completion: @escaping (Result<Places, Error>) -> Void)
    // 2. Async await
    func placesWithAsync() async throws -> Places
}
