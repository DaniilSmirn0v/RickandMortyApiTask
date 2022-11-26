//
//  EpisodeListAssembly.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeListAssembly {
    static func createEpisodeModule() -> UIViewController {
        let navController = UINavigationController()
        let networkService = DefaultNetworkClient()
        let interactor = EpisodeListInteractor(networkService: networkService)
        let view = EpisodeListViewController()
        let router = EpisodeListRouter(navigationController: navController)
        let presenter = EpisodeListPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }
}
