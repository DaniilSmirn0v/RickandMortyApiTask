//
//  DetailCharacterPresenter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation
import UIKit

final class DetailCharacterPresenter {

    // MARK: - Properties

    var view: DetailCharacterViewInputProtocol?
    var interactor: DetailCharacterInteractorInputProtocol?
    var router: DetailCharacterRouterProtocol?

    var characterData: Character?
    private var id: Int

    // MARK: - Initialize

    init(id: Int) {
        self.id = id
    }
}

// MARK: - DetailCharacterViewOutputProtocol

extension DetailCharacterPresenter: DetailCharacterViewOutputProtocol {
    
    func getData() {
        interactor?.getCharactersModel(id: id)
    }
    
}

// MARK: - DetailCharactertInteractorOutputProtocol

extension DetailCharacterPresenter: DetailCharactertInteractorOutputProtocol {
    
    func getCharacterDataSuccess(data: Character) {
        characterData = data

        let cellViewModel: ViewModel = DetailCharactertCellViewModel(
            charactertImage: data.image)

        let character = [
            CharactInfo(
                status: "\(data.statusColor)  Status",
                info: "\(data.status)"
            ),
            CharactInfo(
                status: "🧬  Gender",
                info: "\(data.gender)"
            ),
            CharactInfo(
                status: "👤  Species",
                info: "\(data.species)"
            )]

        let cellTableViewModel: [ViewModel] = character.map { character in
           return DetailTableCellViewModel(
                textInfo: character.status,
                detailTextInfo: character.info
            )
        } 
        view?.configure(with: cellViewModel, data: data, with: cellTableViewModel)
    }

}


