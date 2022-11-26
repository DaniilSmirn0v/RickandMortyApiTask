//
//  EpisodeDetailInteractorOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeDetailInteractorOutputProtocol: AnyObject {
    func getEpisodeDataSuccess(data: Episode, characters: [Character])
    func getEpisodeDataFailure(error: NetworkError)
}
