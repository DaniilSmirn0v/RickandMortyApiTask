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
    private var charactersData: [DetailCharacter] = []

    init(view: EpisodeDetailViewOutputProtocol? = nil, interactor: EpisodeDetailInteractorInputProtocol, router: EpisodeDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func getData()  {
        interactor.fetchDetailEpisode()
    }

    func selectCell(id: Int) {
        router.pushToCharacterDetail(id)
    }
    
    func getCharacters() -> [DetailCharacter] {
        charactersData
    }
}

extension EpisodeDetailPresenter: EpisodeDetailInteractorOutputProtocol {
    func getEpisodeDataSuccess(data: Episode, characters: [DetailCharacter]) {
        charactersData = characters
        let cellViewModel = characters.map { char in
            EpisodeDetailCellViewModel(
                characterImageView: char.image,
                characterNameLabel: char.name
            )
        }
        let headerViewModel: ViewModel = EpisodeDetailHeaderViewModel(
            episodeNameLabel: data.name,
            episodeDateLabel: data.airDate
        )
        
        view?.configure(with: cellViewModel, viewModelHeader: headerViewModel, data: data)
    }

    func getEpisodeDataFailure(error: NetworkError) {
        //TODO:
    }


}
