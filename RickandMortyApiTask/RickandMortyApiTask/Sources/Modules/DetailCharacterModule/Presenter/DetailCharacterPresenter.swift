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
    weak var interactor: DetailCharacterInteractorInputProtocol?
    var router: DetailCharacterRouterProtocol?

    var characterData = Character(
        id: 2,
        name: "Нет",
        status: .alive,
        species: .human,
        gender: .male,
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
    )

}

// MARK: - DetailCharacterViewOutputProtocol

extension DetailCharacterPresenter: DetailCharacterViewOutputProtocol {

    func getCharacter() -> Character? {
        characterData
    }

    func getCharacterName() -> String {
         return characterData.name
    }

   func getCharacterInfo() -> [CharactInfo] {
        return [
            CharactInfo(
                status: "\(characterData.statusColor)  Status",
                info: characterData.status.rawValue
            ),
            CharactInfo(
                status: "🧬  Gender",
                info: characterData.gender.rawValue
            ),
            CharactInfo(
                status: "👤  Species",
                info: characterData.species.rawValue
            ),
        ]
    }

}

// MARK: - DetailCharactertInteractorOutputProtocol

extension DetailCharacterPresenter: DetailCharactertInteractorOutputProtocol {
    
    func getCharacterDataSuccess(data: Character) {
        characterData = data
    }

}


