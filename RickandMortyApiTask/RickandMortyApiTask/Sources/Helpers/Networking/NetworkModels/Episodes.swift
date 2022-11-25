//
//  Episodes.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

// MARK: - Welcome
struct Episodes: Decodable {
    let info: EpisodeInfo
    let results: [Episode]
}

// MARK: - Info
struct EpisodeInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
}

// MARK: - Result
struct Episode: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
