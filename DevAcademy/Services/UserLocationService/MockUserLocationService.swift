//
//  MockUserLocationService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 06.09.2023.
//

import CoreLocation

final class MockLocationService: UserLocationService {
    func startUpdatingLocation() { /* nop */ }
    func stopUpdatingLocation() { /* nop */ }
    func listenDidUpdateLocation(handler: @escaping ([CLLocation]) -> Void) { /* nop */ }
    func requestAuthorization() { /* nop */ }
    func listenDidUpdateStatus(handler: @escaping (CLAuthorizationStatus) -> Void) { /* nop */ }
}
