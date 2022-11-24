//
//  CharactersListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

class CharactersListPresenter: CharactersListViewOutputProtocol {
    // MARK: - Properties

    var interactor: CharactersListInteractor? {
       didSet {
          interactor?.getCharactersModel()
       }
    }

    var view: CharactersListViewInputProtocol?
    private var charactersData: Characterss?
    var router: CharactersListRouterProtocol?

    // MARK: - Methods

    func getCharacters() -> [Results]? {
        charactersData?.results
    }
    
}

// MARK: - CharactersListPresenterInputProtocol

extension CharactersListPresenter: CharactersListPresenterInputProtocol {

    func pullCharactersData(_ data: Characterss) {
        charactersData = data
    }

    func didSelectItem(_ id: Int) {
        router?.openDetailCharactertVC(id)
    }

}
