//
//  DetailCharacterInteractor.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

final class DetailCharacterInteractor: DetailCharacterInteractorInputProtocol {
    // MARK: - Properties

    var presenter: DetailCharactertInteractorOutputProtocol?
    private let id: Int
    private let network: DefaultNetworkClient

    // MARK: - Initializate
    
    init(network: DefaultNetworkClient,
         id: Int) {
        self.network = network
        self.id = id
        getCharactersModel(id: id)
    }

    // MARK: - Methods

    func getCharactersModel(id: Int) {
        Task {
            do {
                let request = RickAndMortyRequestFactory.detailCharacters(id: id).urlReques
                let data: Character = try await network.perform(request: request)
                presenter?.characterData = data
                print(data)
            } catch {
                debugPrint(error)
            }
        }
    }

}
