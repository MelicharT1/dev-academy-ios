//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []
    
    private let placesService: PlacesService
    
    init(placesService: PlacesService) {
        self.placesService = placesService
    }
    
    func fetchData() {
        placesService.places { result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    self.places = places.features
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @MainActor
    func placesWithAsync() async {
        do {
            let placesData = try await placesService.placesWithAsync()
            self.places = placesData.features
        } catch {
            print(error)
        }
    }
}
