//
//  Places.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 18.07.2023.
//

import Foundation

struct Places: Codable {
    let features: [Place]
}

extension Places {
    static let mock: Places = Places(
        features: [
            Place(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                attributes: Properties(
                    ogcFid: 1,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.divadlo),
                    name: "Národní divadlo Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                attributes: Properties(
                    ogcFid: 2,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Kino Art Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
                attributes: Properties(
                    ogcFid: 3,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.muzeum),
                    name: "Moravské zemské muzeum"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                attributes: Properties(
                    ogcFid: 4,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniCentrum),
                    name: "BOUFOU Prostějovská Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                attributes: Properties(
                    ogcFid: 5,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.hudebniKlub),
                    name: "Kabinet múz"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1894, longitude: 165602),
                attributes: Properties(
                    ogcFid: 6,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.knihovna),
                    name: "Moravská zemská knihovna"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                attributes: Properties(
                    ogcFid: 7,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.koncertniHala),
                    name: "Janáčkovo divadlo"
                )
            ),
            Place(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
                attributes: Properties(
                    ogcFid: 8,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniPamátka),
                    name: "Špilberk Brno"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                attributes: Properties(
                    ogcFid: 9,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.letniKino),
                    name: "Letní kino Lužánky"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 10,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.podnikSLulturnimProgramem),
                    name: "Bar, který neexistuje"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 11,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Cinema City"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 12,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Univerzitní kino Scala"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 13,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.hub),
                    name: "Impact Hub"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 14,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniPamátka),
                    name: "Villa Tugendhat"
                )
            ),
            Place(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 15,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.vystaviste),
                    name: "Brněnské výstaviště"
                )
            )
        ]
    )
}
