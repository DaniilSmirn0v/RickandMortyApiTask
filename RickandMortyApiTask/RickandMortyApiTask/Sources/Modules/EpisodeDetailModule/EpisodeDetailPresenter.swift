//
//  EpisodeDetailPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import Foundation
import Kingfisher

class EpisodeDetailPresenter: EpisodeDetailViewInputProtocol {
    weak var view: EpisodeDetailViewOutputProtocol?
    var interactor: EpisodeDetailInteractorInputProtocol
    var router: EpisodeDetailRouterProtocol
    private var id: Int
    private var charactersData: [Character] = []

    init(view: EpisodeDetailViewOutputProtocol? = nil, interactor: EpisodeDetailInteractorInputProtocol, router: EpisodeDetailRouterProtocol, id: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.id = id
    }

    func getData() {
        interactor.fetchDetailEpisode(with: 1)
    }

    func selectCell(id: Int) {
        router.openDetailCharactertVC(id)
    }

    func getCharacters() -> [Character] {
        charactersData
    }
}

extension EpisodeDetailPresenter: EpisodeDetailInteractorOutputProtocol {
    func getEpisodeDataSuccess(data: Episode, characters: [Character]) {
        charactersData = characters
        let cellViewModel = characters.map { char in
            EpisodeDetailCellViewModel(
                characterImageView: char.image,
                characterNameLabel: char.name
            )
        }
        let headerViewModel: ViewModel = EpisodeDetailHeaderViewModel(
            episodeNameLabel: data.name,
            episodeDateLabel: data.airDate,
            titleHeader: data.episode
        )
        view?.configure(with: cellViewModel, viewModelHeader: headerViewModel, data: data)
    }

    func getEpisodeDataFailure(error: NetworkError) {
        //TODO:
    }


}
