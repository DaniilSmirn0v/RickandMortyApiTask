//
//  LocationDetailRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 28.11.2022.
//

import Foundation

class LocationDetailRouter: BaseRouter, LocationDetailRouterProtocol {
    func pushToCharacterDetail(_ id: Int) {
        guard let detailCharacterViewController = assemblyBuilder?.configureDetailCharactertModule(id) else { return }
        viewController?.navigationController?.present(detailCharacterViewController, animated: true)
    }
}
