//
//  Api.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

enum Api {
    case characters
    case detailCharacters(id: Int)
    case locations
    case detailLocation(id: Int)
    case episodes
    case detailEpisodes(id: Int)

    var url: String {
        switch self {
        case .characters:
            return "https://rickandmortyapi.com/api/character"
        case .detailCharacters(id: let id):
            return "https://rickandmortyapi.com/api/character/\(id)"
        case .locations:
            return "https://rickandmortyapi.com/api/location"
        case .detailLocation(id: let id):
            return "https://rickandmortyapi.com/api/location/\(id)"
        case .episodes:
            return "https://rickandmortyapi.com/api/episode"
        case .detailEpisodes(id: let id):
            return "https://rickandmortyapi.com/api/episode/\(id)"
        }
    }
}
