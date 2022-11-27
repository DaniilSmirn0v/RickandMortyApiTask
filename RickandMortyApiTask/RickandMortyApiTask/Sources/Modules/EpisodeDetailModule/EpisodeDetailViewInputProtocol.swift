//
//  EpisodeDetailViewInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

protocol EpisodeDetailViewInputProtocol {
    func getData() 
    func selectCell(id: Int)
    func getCharacters() -> [DetailCharacter]

}
