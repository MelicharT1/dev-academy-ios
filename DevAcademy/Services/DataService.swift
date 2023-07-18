//
//  DataService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

private enum ServiceError: Error {
    case noData
    case fatalError
}

final class DataService {
    static let shared = DataService()
    
    var data: Result<Features, Error>?
    
    private init() {}
    
    func fetchData(closure: @escaping (Result<Features, Error>) -> ()) throws {
        Timer.scheduledTimer(withTimeInterval: 2.2, repeats: false) { [weak self] _ in
            if let data = self?.data {
                closure(data)
                return
            } else {
                closure(.failure(ServiceError.fatalError))
            }
        }
    }
}

extension DataService {
    private static let mockData: Features = .init(
        feature: [
            .init(
                geometry: .init(latitude: 99, longitude: 69),
                properties: .init(ogcFid: 1, obrId: .init(string: "wwww.porn.com")!, druh: .unknown("Nevim"), název: "name")
            )
        ])
}
