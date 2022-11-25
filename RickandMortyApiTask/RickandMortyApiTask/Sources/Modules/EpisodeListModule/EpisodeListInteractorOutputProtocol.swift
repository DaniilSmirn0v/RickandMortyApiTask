//
//  EpisodeListInteractorOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeListInteractorOutputProtocol: AnyObject {
    func getEpisodesDataSuccess(data: Episodes)
    func getEpisodesDataFailure(error: NetworkError)
}
