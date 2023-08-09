//
//  Place.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

struct Place: Equatable {    
    let geometry: Point
    let properties: Properties
}

extension Place {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
}
