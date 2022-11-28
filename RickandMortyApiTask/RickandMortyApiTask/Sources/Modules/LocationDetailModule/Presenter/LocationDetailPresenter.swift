//
//  LocationDetailPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

class LocationDetailPresenter: LocationDetailViewInputProtocol {

    weak var view: LocationDetailViewOutputProtocol?
    var interactor: LocationDetailInteractorInputProtocol
    var router: LocationDetailRouterProtocol
    private var charactersData: [DetailCharacter] = []

    init(view: LocationDetailViewOutputProtocol? = nil, interactor: LocationDetailInteractorInputProtocol, router: LocationDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    

    func getData() {
        interactor.fetchDetailEpisode()
    }

    func selectCell(id: Int) {
        router.pushToCharacterDetail(id)
    }

    func getCharacters() -> [DetailCharacter] {
        charactersData
    }
}

extension LocationDetailPresenter: LocationDetailInteractorOutputProtocol {
    func getLocationDetailDataSuccess(data: LocationData, characters: [DetailCharacter]) {
        charactersData = characters
        let cellViewModel = characters.map { char in
            LocationDetailCellViewModel(
                locationImageView: char.image,
                locationLabel: char.name
            )
        }
        let headerViewModel: ViewModel = LocationDetailHeaderViewModel(
            episodeNameLabel: data.name,
            episodeDateLabel: data.dimension
        )

        view?.configure(with: cellViewModel, viewModelHeader: headerViewModel, data: data)
    }

    func getLocationDetailDataFailure(error: NetworkError) {
        //TODO: error
    }
}
