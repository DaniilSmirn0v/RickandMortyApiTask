//
//  EpisodeListRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeListRouter: BaseRouter, EpisodeListRouterProtocol {

    func pushToEpisodeDetailModule(id: Int) {
        guard let episodeDetailViewController = assemblyBuilder?.configureEpisodeDetailModule(id) else { return }
        viewController?.navigationController?.pushViewController(episodeDetailViewController, animated: true)
        }
    }

