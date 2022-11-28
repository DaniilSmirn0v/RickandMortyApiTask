//
//  Locations.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

struct LocationsResult: Codable {
    let info: LocationsInfo
    let results: [LocationData]
}

struct LocationsInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
}

struct LocationData: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
