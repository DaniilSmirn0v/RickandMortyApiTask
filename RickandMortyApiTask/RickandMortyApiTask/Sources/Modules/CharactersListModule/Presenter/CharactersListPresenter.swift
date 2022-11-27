//
//  CharactersListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

final class CharactersListPresenter {

    // MARK: - Properties

    var interactor: CharactersListInteractorInputProtocol?
    weak var view: CharactersListViewInputProtocol?
    var router: CharactersListRouterProtocol?

    private var charactersData = [Character]()

}

// MARK: - CharactersListViewOutputProtocol

extension CharactersListPresenter: CharactersListViewOutputProtocol {

    func getCharacters() -> [Character] {
        charactersData
    }

    func didSelectItem(_ id: Int) {
        router?.openDetailCharactertVC(id)
    }

}

// MARK: - CharactersListInteractorOutputProtocol

extension CharactersListPresenter: CharactersListInteractorOutputProtocol {
    
    func getСharactersDataSuccess(data: Characterss) {
        charactersData = data.results
        
        let cellViewModel: [ViewModel] = data.results.map { character in
            return CharactersCellViewModel(charactertImage: character.image, characterNameLabel: character.name,
                id: character.id)
        }

        view?.configure(with: cellViewModel)
    }
    
}
