//
//  CharactersListInteractorInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 26.11.22.
//

import Foundation

protocol CharactersListInteractorInputProtocol {
    var presenter: CharactersListInteractorOutputProtocol? { get set }
}

protocol CharactersListInteractorOutputProtocol {
    var charactersData: Characterss? { get set }
}
