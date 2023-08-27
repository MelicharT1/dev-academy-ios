//
//  SettingsViewState.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 23.08.2023.
//

import SwiftUI

enum SettingsPickerValue: String, CaseIterable, Identifiable {
    case on, off
    var id: Self { self }
}

struct SettingsViewState: DynamicProperty {
    let navigationTitle: String = Localization.ViewTitles.settingsTitle
    
    // TODO: po změně uložit do userdefaults (barvu i cornerradius)
    @State var selectedSettingsCornerRadius: SettingsPickerValue = .on
    @State var selectedSettingsMapSection: SettingsPickerValue = .on
    
}
