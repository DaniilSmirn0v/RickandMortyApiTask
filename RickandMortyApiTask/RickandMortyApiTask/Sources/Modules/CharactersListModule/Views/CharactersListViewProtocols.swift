//
//  CharactersListViewProtocols.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

// MARK: - CharactersListViewOutputProtocol

protocol CharactersListViewOutputProtocol {
    var view: CharactersListViewInputProtocol? { get set }
    var interactor: CharactersListInteractorInputProtocol? { get set }
    var router: CharactersListRouterProtocol? { get set }

    func getCharacters() -> [Character]
    func didSelectItem(_ id: Int)
}

// MARK: - CharactersListViewInputProtocol

protocol CharactersListViewInputProtocol: AnyObject  {
    var presenter: CharactersListViewOutputProtocol?  { get set }
    func tapItem(_ id: Int)
    func configure(with viewModels: [ViewModel])
}
