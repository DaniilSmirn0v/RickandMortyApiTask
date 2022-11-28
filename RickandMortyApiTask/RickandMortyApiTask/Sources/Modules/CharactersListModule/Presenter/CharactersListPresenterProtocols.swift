//
//  CharactersListPresenterProtocols.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

// MARK: - CharactersListPresenterInputProtocol

protocol CharactersListPresenterInputProtocol {
    var view: CharactersListPresenterOutputProtocol? { get set }
    var interactor: CharactersListInteractorInputProtocol? { get set }
    var router: CharactersListRouterProtocol? { get set }

    func getCharacters() -> [Character]
    func didSelectItem(_ id: Int)
}

// MARK: - CharactersListPresenterOutputProtocol

protocol CharactersListPresenterOutputProtocol: AnyObject  {
    var presenter: CharactersListPresenterInputProtocol?  { get set }
    func tapItem(_ id: Int)
    func configure(with viewModels: [ViewModel])
}
