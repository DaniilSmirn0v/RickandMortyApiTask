//
//  CharactersListInteractor.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

class CharactersListInteractor {

    private var charactersModel: Characterss?
    private let network: DefaultNetworkClient
    private var presenter: CharactersListPresenterInputProtocol?

    init(network: DefaultNetworkClient, presenter: CharactersListPresenterInputProtocol) {
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
