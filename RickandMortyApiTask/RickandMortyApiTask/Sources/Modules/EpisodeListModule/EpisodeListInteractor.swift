//
//  EpisodeListInteractor.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

class EpisodeListInteractor: EpisodeListInteractorInputProtocol {

    weak var presenter: EpisodeListInteractorOutputProtocol?

    let networkService: NetworkClient

    init(networkService: NetworkClient) {
        self.networkService = networkService
    }

    func fetchEpisodes() {
        Task {
            let request = RickAndMortyRequestFactory.episodes.urlReques
            do {
                let data: Episodes = try await networkService.perform(request: request)
                presenter?.getEpisodesDataSuccess(data: data)
            } catch {
                guard let locolizedError = error as? NetworkError else { return }
                presenter?.getEpisodesDataFailure(error: locolizedError)
            }
        }
    }

    
}
