//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 25.07.2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    @State var features: [Feature] = []
    @State var showFavorites: Bool = false
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        NavigationLink(destination: PlaceDetail(feature: feature)) {
                            PlacesRow(feature: feature)
                        }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                        .frame(width: 30)
                }
            }
            .navigationTitle("Kultůrmapa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarButton
            }
        }
        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavorites) {
            sheetContent
        }
    }
    
    private var toolbarButton: some View {
        Button("Oblíbené") {
            showFavorites.toggle()
        }
    }
    
    private var sheetContent: some View {
        Text("ouuuu.. něco tu chybí")
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
    }
    
    func onFeatureTapped(feature: Feature) {
        features.removeAll {
            $0.properties.ogcFid == feature.properties.ogcFid
        }
    }
    
    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlacesScene()
        }
    }
}
