//
//  SwiftUIView.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 31.08.2023.
//

import SwiftUI

struct FavoriteSceneView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let viewState: FavoriteSceneViewModel

    var body: some View {
        List(viewState.places, id: \.attributes.ogcFid) { place in
            PlacesRow(place: place)
        }
    }
}
