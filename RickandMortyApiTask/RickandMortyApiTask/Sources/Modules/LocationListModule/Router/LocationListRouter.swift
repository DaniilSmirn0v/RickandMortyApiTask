//
//  LocationListRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

class LocationListRouter:  BaseRouter, LocationListModuleProtocol {

    func pushToLocationDetailModule(id: Int) {
        guard let locationDetailViewController = assemblyBuilder?.configureLocationDetailModule(id) else { return }
        viewController?.navigationController?.pushViewController(locationDetailViewController, animated: true)
        }
    }
