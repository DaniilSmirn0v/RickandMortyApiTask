//
//  LocationDetailInteractorOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationDetailInteractorOutputProtocol: AnyObject {
    func getLocationDetailDataSuccess(data: LocationData, characters: [DetailCharacter])
    func getLocationDetailDataFailure(error: NetworkError)
}
