//
//  EpisodeDetailInteractor.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

class EpisodeDetailInteractor: EpisodeDetailInteractorInputProtocol {

    weak var presenter: EpisodeDetailInteractorOutputProtocol?
    let networkService: NetworkClient
    let id: Int

    init(networkService: NetworkClient, id: Int) {
        self.networkService = networkService
        self.id = id
    }

    func fetchDetailEpisode() {
        Task {
            do {
                let request = RickAndMortyRequestFactory.detailEpisodes(id: self.id).urlReques
                let episodeData: Episode = try await networkService.perform(request: request)

                let characters = try await withThrowingTaskGroup(of: DetailCharacter.self) { group in
                    episodeData.characters.forEach { char in
                        guard let urlSting = URL(string: char) else { return }
                        group.addTask {
                            let request = URLRequest(url: urlSting, timeoutInterval: 10)
                            return try await self.networkService.perform(request: request)
                        }
                    }

                    var models: [DetailCharacter] = []

                    for try await result in group {
                        models.append(result)
                    }
                    return models
                }
                presenter?.getEpisodeDataSuccess(data: episodeData, characters: characters)
            } catch {
                guard let locerror = error as? NetworkError else { return }
                presenter?.getEpisodeDataFailure(error: locerror)
            }
        }
    }
}
