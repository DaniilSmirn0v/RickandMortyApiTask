//
//  EpisodeDetailRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeDetailRouter: BaseRouter, EpisodeDetailRouterProtocol {

    func pushToEpisodeDetail(_ id: Int) {
        guard let detailCharacterViewController = assemblyBuilder?.configureDetailCharactertModule(id) else { return }
        viewController?.navigationController?.present(detailCharacterViewController, animated: true)
    }

}
