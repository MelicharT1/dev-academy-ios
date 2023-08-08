//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 01.08.2023.
//

import SwiftUI
import MapKit

struct PlaceDetail: View {
    @State var feature: Feature
    
    var body: some View {
        ZStack {
            mapLayer
            detailPlace
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            ),
            annotationItems: [IdentifiableCoordinate(coordinate: coordinate)]) { location in
                MapMarker(coordinate: location.coordinate, tint: .red)
            }
            .ignoresSafeArea()
    }
    
    private var detailPlace: some View {
        VStack {
            PlacesRow(feature: feature)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
            Spacer()
        }
    }
    
    private var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: feature.geometry.latitude, longitude: feature.geometry.longitude)
    }
}

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(feature: Features.mock.features.first!)
    }
}
