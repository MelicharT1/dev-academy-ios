//
//  ProductionUserLocationService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 06.09.2023.
//

import CoreLocation

final class ProductionUserLocationService: NSObject, UserLocationService {
    private let manager: CLLocationManager
    private var stateChangeHandler: ((CLAuthorizationStatus) -> Void)?
    private var locationChangeHandler: (([CLLocation]) -> Void)?
   
    init(manager: CLLocationManager = CLLocationManager()) {
        self.manager = manager
        // init for `NSObject`
        super.init()
        manager.delegate = self
    }

    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }

    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void) {
        self.locationChangeHandler = handler
    }


    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }

    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }

    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void) {
        self.stateChangeHandler = handler
        handler(manager.authorizationStatus)
    }
}

extension ProductionUserLocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.stateChangeHandler?(manager.authorizationStatus)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationChangeHandler?(locations)
    }
}
