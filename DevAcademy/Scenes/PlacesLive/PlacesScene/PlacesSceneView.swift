//
//  PlacesSceneView.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 25.07.2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesSceneView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let viewState: PlacesSceneViewState = .init()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewState.isPlaceEmpty {
                    List(viewState.places, id: \.attributes.ogcFid) { place in
                        NavigationLink(destination: coordinator.makeDetailView(for: place)) {
                            PlacesRow(place: place)
                        }
                    }
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
    
    /// Toolbar button
    private var toolbarButton: some View {
        Button("Oblíbené", action: viewState.favoritePressed)
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
        }
    }
}
