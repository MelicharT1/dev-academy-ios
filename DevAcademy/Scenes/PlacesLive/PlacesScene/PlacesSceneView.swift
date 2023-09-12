//
//  PlacesSceneView.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 25.07.2023.
//

import SwiftUI
import MapKit
import ActivityIndicatorView

struct PlacesSceneView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let viewState: PlacesSceneViewState = .init()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewState.isPlaceEmpty {
                    TabView {
                        listSection
                        mapSection
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                        .frame(width: 30)
                }
            }
            .navigationTitle(viewState.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { toolbarButton }
        }
        // MARK: - 1) clousure:
        // .onAppear(perform: viewState.fetch)
        // MARK: - 2) async (current)
        .task {
            await viewState.fetchWithAsync()
        }
        .sheet(isPresented: viewState.$showFavorites) { sheetContent }
    }
    
    private var mapSection: some View {
        VStack(spacing: Spacings.zero) {
            Text(Localization.Common.brnoCity)
                .bold()
                .underline()
            Map(
                coordinateRegion: .constant(MKCoordinateRegion(
                    center: viewState.coordinate,
                    span: viewState.span
                )),
                showsUserLocation: true,
                annotationItems: viewState.placesCoordinator) { location in
                    MapMarker(coordinate: location.coordinate, tint: .red)
                }
                .modifier(CornerRadius(value: 30))
                .padding()
        }
    }
    
    private var listSection: some View {
        VStack {
            TextField(Localization.Common.searchTitle, text: viewState.$searchText)
                .padding()
            
            List(
                viewState.places.filter {
                    viewState.searchText.isEmpty
                        ? true
                        : $0.attributes.name.localizedCaseInsensitiveContains(viewState.searchText)
                },
                id: \.attributes.ogcFid
            ) { place in
                NavigationLink(destination: coordinator.makeDetailView(for: place)) {
                    PlacesRow(place: place)
                }
            }
            .modifier(CornerRadius(value: 30))
        }
    }
    
    /// Toolbar button
    private var toolbarButton: some View {
        HStack {
            Button(action: viewState.favoritePressed) {
                Image(systemName: "star")
            }

            NavigationLink(destination: coordinator.setting) {
                Image(systemName: "gear")
            }
        }
    }
    
    /// Content for sheet
    private var sheetContent: some View {
        coordinator.favoriteScene(places: viewState.favorites)
            .presentationDetents([.medium, .large])
    }
}

struct PlacesSceneView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlacesSceneView()
                .injectPreviewsEnvironment()
        }
    }
}
