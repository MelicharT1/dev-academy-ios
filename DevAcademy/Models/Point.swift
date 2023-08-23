//
//  Point.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

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
