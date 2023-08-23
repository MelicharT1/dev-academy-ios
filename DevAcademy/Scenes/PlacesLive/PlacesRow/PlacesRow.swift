//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 25.07.2023.
//

import SwiftUI

struct PlacesRow: View {
    let place: Place
    
    var body: some View {
        HStack {
            imageView
            textSection
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel([place.attributes.name, place.attributes.type.rawValue].compactMap { $0 }.joined(separator: " "))
    }
    
    /// Image view (with AsyncImage
    private var imageView: some View {
        AsyncImage(url: place.attributes.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 4)
        } placeholder: {
            ProgressView()
        }
    }
    
    /// Text section
    private var textSection: some View {
        VStack(alignment: .leading) {
            Text(place.attributes.name)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            Text(place.attributes.type.rawValue)
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(place: Places.mock.features.first!)
    }
}
