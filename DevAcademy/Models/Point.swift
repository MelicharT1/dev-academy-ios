//
//  Point.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import CoreLocation

struct Point: Codable {
    /// as Y value
    let latitude: Double
    /// as X value
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "x"
        case latitude = "y"
    }
}

// CLLocation from Point
extension Point {
    var cllocation: CLLocation {
        .init(latitude: latitude, longitude: longitude)
    }
}
