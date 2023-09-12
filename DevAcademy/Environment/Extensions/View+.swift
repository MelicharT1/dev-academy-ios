//
//  View+.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 08.08.2023.
//

import SwiftUI

private struct EnvironmentModifier: ViewModifier {
    let observableObjects: ObservableObjects
    let coordinator: Coordinator

    func body(content: Content) -> some View {
        content
            .environmentObject(observableObjects.places)
            .environmentObject(coordinator)
    }
}

struct CornerRadius: ViewModifier {
    let value: CGFloat
    
    func body(content: Content) -> some View {
        if AppData.hasCornerRadius {
            content
                .cornerRadius(value)
        } else {
            content
        }
    }
}

extension View {
    func inject(objects: ObservableObjects, coordinator: Coordinator) -> some View {
        modifier(EnvironmentModifier(observableObjects: objects, coordinator: coordinator))
    }

    func injectPreviewsEnvironment() -> some View {
        modifier(EnvironmentModifier(observableObjects: .mock, coordinator: Coordinator()))
    }
}
