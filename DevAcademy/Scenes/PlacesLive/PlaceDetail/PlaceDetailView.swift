//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 01.08.2023.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    let viewState: PlaceDetailViewState
    
    var body: some View {
        ZStack {
            mapLayer
            detailPlace
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// Layer of Map with MapMarker
    private var mapLayer: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(center: viewState.coordinate, span: viewState.span)),
            annotationItems: [IdentifiableCoordinate(coordinate: viewState.coordinate)]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .ignoresSafeArea()
    }
    
    /// Detail place as PlacesRow
    private var detailPlace: some View {
        VStack {
            PlacesRow(place: viewState.place)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
            Spacer()
        }
    }
}

/// IdentifiableCoordinate for Map - `annotationItems`
private struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(viewState: .init(place: Places.mock.features.first!))
    }
}
