//
//  DetailCharacterPresenter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

class DetailCharacterPresenter: DetailCharacterViewOutputProtocol {

    private var charactersData: Characterss?
    var interactor: DetailCharacterInteractor? {
       didSet {
          interactor?.getCharactersModel()
       }
    }

    var view: DetailCharacterViewInputProtocol?
    
}

// MARK: - DetailCharacterPresenterInputProtocol

extension DetailCharacterPresenter: DetailCharacterPresenterInputProtocol {

    func pullCharactersData(_ data: Characterss) {
        charactersData = data
    }

}
