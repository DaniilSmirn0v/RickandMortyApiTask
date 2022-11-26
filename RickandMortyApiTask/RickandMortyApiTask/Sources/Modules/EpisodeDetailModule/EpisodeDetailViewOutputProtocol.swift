//
//  EpisodeDetailViewOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeDetailViewOutputProtocol: AnyObject {
    func configure(with viewModelsCell: [ViewModel], viewModelHeader: ViewModel, data: Episode)
    func selectCell(id: Int)
}
