//
//  Localization.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 27.08.2023.
//

import Foundation

public enum Localization {
    // MARK: - Common
    public enum Common {
        /// Brno
        public static var brnoCity: String = {
            NSLocalizedString("Brno", comment: "")
        }()
        
        /// Vypnuto
        public static var disable: String = {
            NSLocalizedString("Vypnuto ", comment: "")
        }()
        
        /// Povoleno
        public static var allow: String = {
            NSLocalizedString("Povoleno ", comment: "")
        }()
    }
    
    // MARK: - PlaceDetail
    public enum PlaceDetail {
        /// Poloha není k dispozici 😭
        public static var emptyMap: String = {
            NSLocalizedString("Poloha není k dispozici 😭", comment: "")
        }()
        
        /// Volat
        public static var callTitle: String = {
            NSLocalizedString("Volat", comment: "")
        }()
        
        /// Web
        public static var webTitle: String = {
            NSLocalizedString("Web", comment: "")
        }()
        
        /// Navigovat
        public static var navigationTitle: String = {
            NSLocalizedString("Navigovat", comment: "")
        }()
    }
    
    // MARK: - Settings
    public enum Settings {
        /// UI
        public static var uiSection: String = {
            NSLocalizedString("UI ", comment: "")
        }()
        
        /// Extra
        public static var extraSection: String = {
            NSLocalizedString("Extra ", comment: "")
        }()
        
        /// Nabídka akcí u mapy
        public static var mapSection: String = {
            NSLocalizedString("Nabídka akcí u mapy ", comment: "")
        }()
        
        /// Zaoblení rohů
        public static var cornerRadius: String = {
            NSLocalizedString("Zaoblení rohů ", comment: "")
        }()
    }
    
    // MARK: - ViewTitles
    public enum ViewTitles {
        /// Kultůrmapa
        public static var menuTitle: String = {
            NSLocalizedString("Kultůrmapa", comment: "")
        }()
        
        /// Tvé nastavení
        public static var settingsTitle: String = {
            NSLocalizedString("Tvé nastavení", comment: "")
        }()
    }
}
