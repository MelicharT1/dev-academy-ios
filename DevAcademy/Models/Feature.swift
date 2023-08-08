//
//  Feature.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

struct Feature: Equatable {    
    let geometry: Point
    let properties: Properties
}

extension Feature {
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        lhs.properties.ogcFid == rhs.properties.ogcFid
    }
}
