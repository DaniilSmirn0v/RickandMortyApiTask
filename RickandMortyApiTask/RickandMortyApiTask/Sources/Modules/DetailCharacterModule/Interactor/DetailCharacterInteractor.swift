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

    func getCharactersModel() {
        Task {
            do {
                let request = RickAndMortyRequestFactory.characters.urlReques
                let data: Characterss = try await network.perform(request: request)
                presenter?.pullCharactersData(data)
            } catch {
                debugPrint(error)
            }
        }
    }

}
