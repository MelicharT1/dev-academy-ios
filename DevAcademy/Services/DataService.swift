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
    
    func fetchData(closure: @escaping (Result<Features, Error>) -> ()) {
        if let data = self.data {
            closure(data)
            return
        } else {
            Timer.scheduledTimer(withTimeInterval: 2.2, repeats: false) { [weak self] _ in
                let result: Result<Features, Error> = .success(DataService.mockData)
                self?.data = result
                closure(result)
            }
        }
    }
}

extension DataService {
    private static let mockData: Features = Features.mock
}
