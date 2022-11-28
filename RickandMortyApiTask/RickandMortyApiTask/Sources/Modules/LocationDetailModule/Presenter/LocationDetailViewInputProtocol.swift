//
//  LocationDetailViewInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationDetailViewInputProtocol {
    func getData()
    func selectCell(id: Int)
    func getCharacters() -> [DetailCharacter]
}
