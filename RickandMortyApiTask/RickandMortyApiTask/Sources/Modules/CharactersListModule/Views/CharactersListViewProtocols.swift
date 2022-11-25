//
//  CharactersListViewProtocols.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

// MARK: - CharactersListViewOutputProtocol

protocol CharactersListViewOutputProtocol {
    func getCharacters() -> [Character]?
    func didSelectItem(_ id: Int)
}

// MARK: - CharactersListViewInputProtocol

protocol CharactersListViewInputProtocol: AnyObject  {

}
