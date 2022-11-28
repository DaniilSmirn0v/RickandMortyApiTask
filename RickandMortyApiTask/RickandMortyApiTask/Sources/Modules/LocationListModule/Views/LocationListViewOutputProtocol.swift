//
//  LocationListViewOutputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationListViewOutputProtocol: AnyObject {
    func configure(with viewModels: [ViewModel])
    func failure(error: NetworkError)
    func tapItem(id: Int)
}
