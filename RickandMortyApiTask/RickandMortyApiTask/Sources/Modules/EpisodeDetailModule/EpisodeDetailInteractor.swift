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

    init(networkService: NetworkClient) {
        self.networkService = networkService
    }

    func fetchDetailEpisode(with id: Int) {
        Task {
            let request = RickAndMortyRequestFactory.detailEpisodes(id: id).urlReques
            do {
                let episodeData: Episode = try await networkService.perform(request: request)
                let charData = episodeData.characters
                let characters = try await withThrowingTaskGroup(of: [Character].self, returning: [Character].self) { group in
                    charData.forEach { char in
                        guard let urlSting = URL(string: char) else { return }
                        let request = URLRequest(url: urlSting, timeoutInterval: 10)
                        group.addTask {
                            return try await self.networkService.perform(request: request)
                        }
                    }

                    var models: [Character] = []

                    for try await result in group {
                        models.append(contentsOf: result)
                    }
                    return models
                }
                debugPrint(episodeData)
                debugPrint(characters)
                presenter?.getEpisodeDataSuccess(data: episodeData, characters: characters)
            } catch {
                guard let locerror = error as? NetworkError else { return }
                presenter?.getEpisodeDataFailure(error: locerror)
            }
        }
    }
}
