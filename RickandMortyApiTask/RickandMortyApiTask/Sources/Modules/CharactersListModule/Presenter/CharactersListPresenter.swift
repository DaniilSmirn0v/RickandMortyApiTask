//
//  CharactersListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

final class CharactersListPresenter: CharactersListInteractorOutputProtocol {

    // MARK: - Properties

    var interactor: CharactersListInteractorInputProtocol?
    weak var view: CharactersListViewInputProtocol?
    var router: CharactersListRouterProtocol?

    var charactersData: Characterss?

    // MARK: - Methods

    func getCharacters() -> [Character]? {
        charactersData?.results
    }
    
}

// MARK: - CharactersListViewOutputProtocol

extension CharactersListPresenter: CharactersListViewOutputProtocol {

    func didSelectItem(_ id: Int) {
        router?.openDetailCharactertVC(id)
    }

}
