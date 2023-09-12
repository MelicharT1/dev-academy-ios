//
//  AppData.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 11.09.2023.
//

import SwiftUI

struct AppData {
    struct AppDataKey {
        static let hasCornerRadius = "hasCornerRadius"
        static let hasMapSection = "hasMapSection"
    }

    /// Display disabled (default is false)
    @AppStorage(AppDataKey.hasMapSection)
    static var hasMapSection: Bool = false

    /// For finish or show onboarding (default is false)
    @AppStorage(AppDataKey.hasCornerRadius)
    static var hasCornerRadius: Bool = false
}
