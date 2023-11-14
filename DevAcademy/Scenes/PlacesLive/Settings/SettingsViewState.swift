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
    
    @State var selectedSettingsCornerRadius: SettingsPickerValue = AppData.hasCornerRadius ? .on : .off
    @State var selectedSettingsMapSection: SettingsPickerValue = AppData.hasMapSection ? .on : .off
    
}
