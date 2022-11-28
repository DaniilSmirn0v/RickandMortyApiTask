//
//  LocationListPresenter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

class LocationListPresenter: LocationListViewInputProtocol {
    
    weak var view: LocationListViewOutputProtocol?
    var interactor: LocationListInteractorInputProtocol
    var router: LocationListRouter
    var locations: [LocationData] = []

    init(view: LocationListViewOutputProtocol? = nil, interactor: LocationListInteractorInputProtocol, router: LocationListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func getData() {
        interactor.fetchLocations()
    }

    func didSelectItem(_ id: Int) {
        router.pushToLocationDetailModule(id: id)
    }

    func getLocations() -> [LocationData] {
        return locations
    }
}

extension LocationListPresenter: LocationListInteractorOutputProtocol {
    func getLocationsDataSuccess(data: LocationsResult) {
        locations = data.results
        let cellViewModel: [ViewModel] = locations.map { location in
            LocationListCellViewModel(
                locationImageView: location.name,
                locationNameLabel: location.name
            )
        }
        view?.configure(with: cellViewModel)
    }

    func getLocationsDataFailure(error: NetworkError) {
        view?.failure(error: error)
    }
}
