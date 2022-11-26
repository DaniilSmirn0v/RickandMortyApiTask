//
//  EpisodeListViewOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeListViewOutputProtocol: AnyObject {
    func configure(with viewModels: [ViewModel])
    func failure(error: NetworkError)
    func tapItem(id: Int)
}
