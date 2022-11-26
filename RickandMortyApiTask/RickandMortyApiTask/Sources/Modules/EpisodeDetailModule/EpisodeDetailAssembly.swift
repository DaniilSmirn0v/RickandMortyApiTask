//
//  EpisodeDetailAssembly.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeDetailAssembly {

    static func createEpisodeModule(_ id: Int) -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = EpisodeDetailInteractor(networkService: networkService)
        let router = EpisodeDetailRouter()
        let presenter = EpisodeDetailPresenter(interactor: interactor, router: router, id: id)
        let view = EpisodeDetailViewController()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
