//
//  MapApps.swift
//  MapActionSheetDemo
//
//  Created by Sharvari on 2023-12-12.
//

import Foundation

enum MapApps: Hashable{
    case apple(Double, Double)
    case google(Double, Double)

    var title: String {
        switch self {
            case .apple: "Apple Maps"
            case .google: "Google Maps"
        }
    }

    var url: String {
        switch self {
            case .apple: "http://maps.apple.com/"
            case .google: "comgooglemaps://"
        }
    }

    var link: String {
        switch self {
            case .apple(let latitude, let longitude): "http://maps.apple.com/?daddr=\(latitude),\(longitude)"
            case .google(let latitude, let longitude):  "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving"
        }
    }
}
