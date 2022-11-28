//
//  DetailCharacterInteractorInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 25.11.22.
//

import Foundation

protocol DetailCharacterInteractorInputProtocol: AnyObject {
    var presenter: DetailCharactertInteractorOutputProtocol? { get set }
    func getCharactersModel(id: Int)
}

protocol DetailCharactertInteractorOutputProtocol {
    func getCharacterDataSuccess(data: Character)
}
