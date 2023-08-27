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
        ZStack {
            Text(Localization.PlaceDetail.emptyMap)
                .font(.title2)
                .fontWeight(.semibold)
            
            viewState.coordinate.map { coordinate in
                Map(
                    coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: viewState.span)),
                    annotationItems: [IdentifiableCoordinate(coordinate: coordinate)]) { location in
                        MapMarker(coordinate: location.coordinate, tint: .red)
                    }
                    .ignoresSafeArea()
            }
        }
    }
    
    /// Detail place as PlacesRow
    private var detailPlace: some View {
        VStack {
            PlacesRow(place: viewState.place)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
            
            Spacer()
            
            mapSection
        }
    }
    
    private var mapSection: some View {
        HStack {
            Spacer()
            
            VStack(spacing: Spacings.standard) {
                viewState.place.attributes.phoneNumber.map { _ in
                    makeButton(title: Localization.PlaceDetail.callTitle, action: viewState.didTapCall)
                }
                
                viewState.place.attributes.website.map { _ in
                    makeButton(title: Localization.PlaceDetail.webTitle, action: viewState.didTapOpenLink)
                }
                
                viewState.place.geometry.map { _ in 
                    makeButton(title: Localization.PlaceDetail.navigationTitle, action: viewState.didTapOpenNavigation)
                }

            }
            .padding(.vertical)
            .padding(.horizontal)
        }
    }
    
    private func makeButton(title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Text(title)
        }
        .padding(.horizontal)
        .frame(width: 120, height: 40)
        .background(.ultraThickMaterial)
        .cornerRadius(10)
        .shadow(color: .black, radius: 0.7)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(viewState: .init(place: Places.mock.features.first!, mapService: MapService()))
            .injectPreviewsEnvironment()
    }
}
