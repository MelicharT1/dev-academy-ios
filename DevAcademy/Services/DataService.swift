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
    
    var data: Result<Places, Error>?
    
    private init() {}
    
    func fetchData(closure: @escaping (Result<Places, Error>) -> ()) {
        if let data = self.data {
            closure(data)
            return
        } else {
            Timer.scheduledTimer(withTimeInterval: 2.2, repeats: false) { [weak self] _ in
                let result: Result<Places, Error> = .success(DataService.mockData)
                self?.data = result
                closure(result)
            }
        }
    }
}

extension DataService {
    private static let mockData: Places = Places.mock
}
