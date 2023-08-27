//
//  MapService.swift
//  DevAcademy
//
//  Created by Tomáš Melichar on 27.08.2023.
//

import Foundation
import MapKit

final class MapService {
    func didTapOpenNavigation(for coordinate: CLLocationCoordinate2D) {
        guard let url = URL(string: "maps://?address=\(coordinate.latitude),\(coordinate.longitude)") else { return }
        
        UIApplication.shared.open(url)
    }
    
    func didTapOpenLink(for url: URL) {
        UIApplication.shared.open(url)
    }
    
    func didTapCall(number: String) {
        guard let url = URL(string: "telprompt://\(number)") else { return }
        
        let application = UIApplication.shared
        guard application.canOpenURL(url) else { return }
        application.open(url, options: [:], completionHandler: nil)
    }
}
