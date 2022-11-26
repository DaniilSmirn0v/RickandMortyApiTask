//
//  EpisodeListRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeListRouter: EpisodeListRouterProtocol {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func pushToEpisodeDetail(id: Int) {

            let detailEpisodeViewController = EpisodeDetailAssembly.createEpisodeModule(id)
            navigationController.pushViewController(detailEpisodeViewController, animated: true)
        }
    }

