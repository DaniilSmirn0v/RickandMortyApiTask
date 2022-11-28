//
//  LocationListViewInputProtocol.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

protocol LocationListViewInputProtocol: AnyObject {
    func getData()
    func didSelectItem(_ id: Int)
    func getLocations() -> [LocationData]
}
