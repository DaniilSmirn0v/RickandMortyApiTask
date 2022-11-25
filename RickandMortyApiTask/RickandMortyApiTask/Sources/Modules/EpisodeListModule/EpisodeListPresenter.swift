//
//  EpisodeListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation

class EpisodeListPresenter: EpisodeListViewInputProtocol {

    weak var view: EpisodeListViewOutputProtocol?
    var interactor: EpisodeListInteractorInputProtocol
    var router: EpisodeListRouterProtocol


    init(view: EpisodeListViewOutputProtocol? = nil, interactor: EpisodeListInteractorInputProtocol, router: EpisodeListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func getData() {
        interactor.fetchEpisodes()
    }
}

extension EpisodeListPresenter: EpisodeListInteractorOutputProtocol {
    func getEpisodesDataSuccess(data: Episodes) {
        let episodes = data.results
        let cellViewModel: [CellViewModel] = episodes.map { episode in
            EpisodeListCellViewModel(
                episodeNumberLable: String(episode.id),
                episodeNameLabel: episode.name,
                episodeLabel: episode.episode,
                dateLabel: episode.air_date
            )
        }
        view?.configure(with: cellViewModel)
    }

    func getEpisodesDataFailure(error: NetworkError) {
        view?.failure(error: error)
    }
}
