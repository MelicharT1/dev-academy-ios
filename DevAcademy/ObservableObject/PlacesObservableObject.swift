//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

final class PlacesObservableObject: ObservableObject {
    @Published var places = [Place]()
    
    private let placesService: PlacesService
    
    private(set) var favorites: [Int]? {
        get { (UserDefaults.standard.array(forKey: "favourites") ?? []) as? [Int] }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
            updatePlaces()
        }
    }
    
    var rawPlaces: [Place] = [] {
        didSet {
            updatePlaces()
        }
    }
    
    init(placesService: PlacesService) {
        self.placesService = placesService
    }
    
    func fetchData() {
        placesService.places { result in
            switch result {
            case .success(let places):
                DispatchQueue.main.async {
                    self.rawPlaces = places.features
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func set(place: Place, favorite: Bool) {
        if favorite {
            if !isFavorite(place: place) { favorites?.append(place.attributes.ogcFid) }
        } else {
            favorites?.removeAll { $0 == place.attributes.ogcFid }
        }
    }
    
    func updatePlaces() {
        places.append(contentsOf: rawPlaces)
        guard let favorites = favorites else { return }
        
        for favoriteID in favorites {
            if let index = places.firstIndex(where: { $0.attributes.ogcFid == favoriteID }) {
                let item = places.remove(at: index)
                places.insert(item, at: 0)
            }
        }
    }
    
    func isFavorite(place: Place) -> Bool {
        guard let favorites = favorites else { return false }
        return favorites.contains { $0 == place.attributes.ogcFid }
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
