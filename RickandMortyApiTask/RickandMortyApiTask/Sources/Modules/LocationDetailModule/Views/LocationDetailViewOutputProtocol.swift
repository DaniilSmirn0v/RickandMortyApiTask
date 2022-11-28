//
//  LocationDetailViewOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationDetailViewOutputProtocol: AnyObject {
    func configure(with viewModelsCell: [ViewModel], viewModelHeader: ViewModel, data: LocationData)
    func selectCell(id: Int)
}

