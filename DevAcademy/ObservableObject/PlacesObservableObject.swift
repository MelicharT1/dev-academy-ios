//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI
import CoreLocation

final class PlacesObservableObject: ObservableObject {
    @Published var places = [Place]()
    
    private let placesService: PlacesService
    private var lastUpdatedLocation: CLLocation?
    private let userLocationService: UserLocationService
    
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
    
    init(placesService: PlacesService, userLocationService: UserLocationService) {
        self.placesService = placesService
        self.userLocationService = userLocationService
        
        self.userLocationService.listenDidUpdateLocation { [weak self] location in
            DispatchQueue.main.async {
                self?.locationDidUpdate(location: location)
            }
        }
        
        handleStatus()
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
        var regularPlaces = places
        
        if let lastUpdatedLocation {
            regularPlaces.sort { lPlace, rPlace in
                guard let rPoint = rPlace.geometry?.cllocation else {
                    return false
                }
                guard let lPoint = lPlace.geometry?.cllocation else {
                    return true
                }
                
                return lastUpdatedLocation.distance(from: lPoint).magnitude < lastUpdatedLocation.distance(from: rPoint).magnitude
            }
        }
        
        var newPlaces = places
        guard let favorites = favorites else { return }
        
        for favoriteID in favorites {
            if let index = newPlaces.firstIndex(where: { $0.attributes.ogcFid == favoriteID }) {
                let item = newPlaces.remove(at: index)
                newPlaces.insert(item, at: 0)
            }
        }
        places = newPlaces
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

extension PlacesObservableObject {
    private func handleStatus() {
        self.userLocationService.listenDidUpdateStatus { [weak self] status in
            switch status {
            case .notDetermined:
                self?.userLocationService.requestAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                self?.beginLocationUpdates()
            default: break
            }
        }
    }
    
    private func shouldUpdate(location: CLLocation) -> Bool {
            lastUpdatedLocation.flatMap { $0.distance(from: location).magnitude > 500 } ?? true
        }
        
        private func beginLocationUpdates() {
            self.userLocationService.startUpdatingLocation()
        }
        
        private func locationDidUpdate(location: [CLLocation]) {
            guard let userLocation = location.first, shouldUpdate(location: userLocation) else { return }
            self.lastUpdatedLocation = userLocation
            updatePlaces()
        }
}
