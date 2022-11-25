//
//  DetailCharacterInteractor.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

class DetailCharacterInteractor {

    private var charactersModel: Characterss?
    private let network: DefaultNetworkClient
    private var presenter: DetailCharacterPresenterInputProtocol?

    init(network: DefaultNetworkClient, presenter: DetailCharacterPresenterInputProtocol) {
        self.network = network
        self.presenter = presenter
    }

    func getCharactersModel(id: Int) {
        Task {
            do {
                let request = RickAndMortyRequestFactory.detailCharacters(id: id).urlReques
                let data: Character = try await network.perform(request: request)
                presenter?.pullCharacterData(data)
            } catch {
                debugPrint(error)
            }
        }
    }

}
