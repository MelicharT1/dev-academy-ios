//
//  SettingsView.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 23.08.2023.
//

import SwiftUI

struct SettingsView: View {
    let viewState = SettingsViewState()
    
    var body: some View {
        Form {
            Section(Localization.Settings.uiSection) {
                VStack {
                    Picker(Localization.Settings.cornerRadius, selection: viewState.$selectedSettingsCornerRadius) {
                        Text(Localization.Common.allow).tag(SettingsPickerValue.on)
                        
                        Text(Localization.Common.disable).tag(SettingsPickerValue.off)
                    }
                }
            }
            
            Section(Localization.Settings.extraSection) {
                Picker(Localization.Settings.mapSection, selection: viewState.$selectedSettingsMapSection) {
                    Text(Localization.Common.allow).tag(SettingsPickerValue.on)
                    
                    Text(Localization.Common.disable).tag(SettingsPickerValue.off)
                }
            }
        }
        .navigationTitle(viewState.navigationTitle)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}
