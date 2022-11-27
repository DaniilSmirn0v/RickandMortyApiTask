//
//  DetailCharacter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 27.11.2022.
//

import Foundation

struct DetailCharacter: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}

