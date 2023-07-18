//
//  PossibleKind.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

enum PossibleKind: RawRepresentable {
    case kind(Kind)
    case unknown(String)
    
    var rawValue: String {
        switch self {
        case .kind(let kind):
            return kind.rawValue
        case .unknown(let string):
            return string
        }
    }
    
    init?(rawValue: String) {
        guard let kind = Kind(rawValue: rawValue) else {
            self = .unknown(rawValue)
            return
        }
        self = .kind(kind)
        
    }
}
