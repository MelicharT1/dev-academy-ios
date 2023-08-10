//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []
    
    private let dataService: DataService = DataService.shared
    
    func fetchData() {
        dataService.fetchData { result in
            switch result {
            case .success(let places):
                self.places = places.places
            case .failure(let error):
                print(error)
            }
        }
    }
}
