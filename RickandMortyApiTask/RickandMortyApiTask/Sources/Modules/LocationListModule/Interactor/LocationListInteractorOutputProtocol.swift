//
//  LocationListInteractorOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationListInteractorOutputProtocol: AnyObject {
    func getLocationsDataSuccess(data: LocationsResult)
    func getLocationsDataFailure(error: NetworkError)
}
