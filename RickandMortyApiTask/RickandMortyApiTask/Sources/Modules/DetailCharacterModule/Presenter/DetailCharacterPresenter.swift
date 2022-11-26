//
//  DetailCharacterPresenter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

final class DetailCharacterPresenter: DetailCharactertInteractorOutputProtocol {

    // MARK: - Properties

    weak var view: DetailCharacterViewInputProtocol?
    var interactor: DetailCharacterInteractorInputProtocol?

    var characterData: Character?

    // MARK: - Methods

    func getCharacterName() -> String? {
        characterData?.name
    }

    func getCharacterInfo() -> Character? {
        characterData
    }

//    func getImageURL() -> URL? {
//        guard let stringURL = characterData?.image else { return nil }
//        return URL(string: stringURL)
//    }
}

// MARK: - DetailCharacterViewOutputProtocol

extension DetailCharacterPresenter: DetailCharacterViewOutputProtocol {

    func pullCharacterData(_ data: Character) {
        characterData = data
    }

}



