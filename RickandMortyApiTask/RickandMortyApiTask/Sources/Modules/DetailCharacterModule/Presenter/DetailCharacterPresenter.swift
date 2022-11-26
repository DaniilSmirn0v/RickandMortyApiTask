//
//  DetailCharacterPresenter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

final class DetailCharacterPresenter {

    // MARK: - Properties

    weak var view: DetailCharacterViewInputProtocol?
    var interactor: DetailCharacterInteractorInputProtocol?

    var characterData: Character?

}

// MARK: - DetailCharacterViewOutputProtocol

extension DetailCharacterPresenter: DetailCharacterViewOutputProtocol {

    func getCharacterInfo() -> Character? {
        characterData
    }

    func getCharacterName() -> String {
        characterData?.name ?? "Name"
    }

}

// MARK: - DetailCharactertInteractorOutputProtocol

extension DetailCharacterPresenter: DetailCharactertInteractorOutputProtocol {

    func getCharacterDataSuccess(data: Character) {
        characterData = data
        
    }



    
}


