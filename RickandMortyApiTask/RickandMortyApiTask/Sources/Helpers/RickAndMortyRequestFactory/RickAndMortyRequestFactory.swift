//
//  RickAndMortyRequestFactory.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

enum RickAndMortyRequestFactory {
    case characters
    case detailCharacters(id: Int)
    case locations
    case detailLocation(id: Int)
    case episodes
    case detailEpisodes(id: Int)

    var urlReques: URLRequest {
        switch self {
        case .characters:
            return createRequest(url: Api.characters.url)
        case .detailCharacters(id: let id):
            return createRequest(url: Api.detailCharacters(id: id).url)
        case .locations:
            return createRequest(url: Api.locations.url)
        case .detailLocation(id: let id):
            return createRequest(url: Api.detailLocation(id: id).url)
        case .episodes:
            return createRequest(url: Api.episodes.url)
        case .detailEpisodes(id: let id):
            return createRequest(url: Api.detailEpisodes(id: id).url)
        }
    }

    private func createRequest(url: String) -> URLRequest {
        let url = URL(string: url) ?? URL(fileURLWithPath: "")
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        return request
    }

}
