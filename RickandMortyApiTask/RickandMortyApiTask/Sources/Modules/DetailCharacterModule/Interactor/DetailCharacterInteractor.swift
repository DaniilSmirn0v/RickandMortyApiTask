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
    private let network: DefaultNetworkClient
    
    // MARK: - Initializate
    
    init(network: DefaultNetworkClient) {
        self.network = network
    }
    
    // MARK: - Methods
    
    func getCharactersModel(id: Int) {
        Task {
            do {
                let request = RickAndMortyRequestFactory.detailCharacters(id: id).urlReques
                let data: Character = try await network.perform(request: request)
                presenter?.getCharacterDataSuccess(data: data)
            } catch {
                debugPrint(error)
            }
        }
    }
    
}
