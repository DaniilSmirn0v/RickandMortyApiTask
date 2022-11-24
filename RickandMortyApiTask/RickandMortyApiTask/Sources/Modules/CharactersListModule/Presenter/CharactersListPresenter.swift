//
//  CharactersListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

class CharactersListPresenter: CharactersListViewOutputProtocol {

    private var charactersData: Characterss?
    var interactor: CharactersListInteractor? {
       didSet {
          interactor?.getCharactersModel()
       }
    }

    var view: CharactersListViewInputProtocol?

    func getCharacters() -> [Results]? {
        charactersData?.results
    }
    
}

extension CharactersListPresenter:  CharactersListPresenterInputProtocol {

    func pullCharactersData(_ data: Characterss) {
        charactersData = data
    }

}
