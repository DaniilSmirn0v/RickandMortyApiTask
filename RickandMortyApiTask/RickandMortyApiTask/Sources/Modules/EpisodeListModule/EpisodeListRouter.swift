//
//  EpisodeListRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeListRouter: EpisodeListRouterProtocol {

    var navigationController: UINavigationController?


    func pushToEpisodeDetail(id: Int) {
        if let navigationController = navigationController {
            let detailEpisodeViewController = EpisodeDetailViewController()
            navigationController.pushViewController(detailEpisodeViewController, animated: true)
        }
    }
}
