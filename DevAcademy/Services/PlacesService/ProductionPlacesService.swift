//
//  ProductionPlacesService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 16.08.2023.
//

import Foundation

private struct ApiConstants {
    static let url = "https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json"
    /// Current is `Get`
    static let httpMethod = "GET"
}

private enum APIError: Error {
    case invalidData
    case invalidResponse
    case badDecoding(Error)
}

// MARK: - ProductionPlacesService
final class ProductionPlacesService: PlacesService {
    func placesWithAsync() async throws -> Places {
        // Default `URLSession` without configuration
        let session = URLSession.shared
        let url = URL(string: ApiConstants.url)!
        var request = URLRequest(url: url)
        request.httpMethod = ApiConstants.httpMethod
        
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
            throw APIError.invalidResponse
        }
        
        return try JSONDecoder().decode(Places.self, from: data)
    }
    
    func places(_ completion: @escaping (Result<Places, Error>) -> Void) {
        // Default `URLSession` without configuration
        let session = URLSession.shared
        let url = URL(string: ApiConstants.url)!
        var request = URLRequest(url: url)
        request.httpMethod = ApiConstants.httpMethod
        
        let task = session.dataTask(with: request) { data, response, error in
            // DATA
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            // RESPONSE
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            do {
                let places = try JSONDecoder().decode(Places.self, from: data)
                completion(.success(places))
            } catch {
                completion(.failure(APIError.badDecoding(error)))
            }
        }
        // Run call
        task.resume()
    }
}
