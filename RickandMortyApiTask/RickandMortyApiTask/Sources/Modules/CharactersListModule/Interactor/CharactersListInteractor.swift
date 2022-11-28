//
//  CharactersListInteractor.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

final class CharactersListInteractor: CharactersListInteractorInputProtocol {
    // MARK: - Properties

    var presenter: CharactersListInteractorOutputProtocol?
    private var charactersModel: Characterss?
    private let network: DefaultNetworkClient
    private var isLoadingPage = false

    // MARK: - Initialize

    init(network: DefaultNetworkClient) {
        self.network = network
        getCharactersModel()
    }

    // MARK: - Methods
    
    func getCharactersModel() {
        Task {
            do {
                let request = RickAndMortyRequestFactory.characters.urlReques
                let data: Characterss = try await network.perform(request: request)
                presenter?.getСharactersDataSuccess(data: data)
            } catch {
                debugPrint(error)
            }
        }
    }
    
}
