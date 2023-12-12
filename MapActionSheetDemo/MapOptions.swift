//
//  MapOptions.swift
//  MapActionSheetDemo
//
//  Created by Sharvari on 2023-12-12.
//

import Foundation

struct MapOptions: Codable, Hashable{
    var title: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var link: String = ""
}
