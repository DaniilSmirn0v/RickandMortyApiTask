//
//  DetailCharacterPresenter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

class DetailCharacterPresenter: DetailCharacterViewOutputProtocol {
    // MARK: - Properties
    
    private var characterData: Results?
    var interactor: DetailCharacterInteractor? {
       didSet {
           interactor?.getCharactersModel(id: id ?? 0)
       }
    }
    
    var view: DetailCharacterViewInputProtocol?

    private var id: Int?

    // MARK: - Initializate

    init(id: Int) {
        self.id = id
    }

    // MARK: - Methods

    func getCharacterName() -> String? {
        characterData?.name
    }

    func getCharacterInfo() -> Results? {
        characterData
    }
}

// MARK: - DetailCharacterPresenterInputProtocol

extension DetailCharacterPresenter: DetailCharacterPresenterInputProtocol {

    func pullCharacterData(_ data: Results) {
        characterData = data
    }

}
