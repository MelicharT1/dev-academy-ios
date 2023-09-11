//
//  UserLocationService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 05.09.2023.
//

import CoreLocation

protocol UserLocationService {
    func startUpdatingLocation()
    func stopUpdatingLocation()
    func requestAuthorization()

    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void)
    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void)
}
