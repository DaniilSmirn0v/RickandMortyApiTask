//
//  EpisodeListViewInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeListViewInputProtocol: AnyObject {
    func getData()
    func didSelectItem(_ id: Int)
    func getEpisode() -> [Episode]
}
