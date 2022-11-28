//
//  LocationListInteractor.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

class LocationListInteractor: LocationListInteractorInputProtocol {

    weak var presenter: LocationListInteractorOutputProtocol?

    let networkService: NetworkClient

    init(networkService: NetworkClient) {
        self.networkService = networkService
    }

    func fetchLocations() {
        Task {
            let request = RickAndMortyRequestFactory.locations.urlReques
            do {
                let data: LocationsResult = try await networkService.perform(request: request)
                presenter?.getLocationsDataSuccess(data: data)
            } catch {
                guard let locolizedError = error as? NetworkError else { return }
                presenter?.getLocationsDataFailure(error: locolizedError)
            }
        }
    }
}
