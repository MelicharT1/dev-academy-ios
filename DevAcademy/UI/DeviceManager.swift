//
//  DeviceManager.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 11.09.2023.
//

import UIKit

enum DeviceManager {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public static var appVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    // Build number from project, for example: 359
    public static var appBuild: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
