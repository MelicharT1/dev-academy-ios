//
//  Properties.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

struct Properties: Codable {
    var ogcFid: Int
    var imageURL: URL?
    var type: PossibleKind
    var name: String
    var email: String?
    var phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case imageURL = "obr_id1"
        case type = "druh"
        case name = "nazev"
        case email
        case phoneNumber = "telefon"
    }
}
