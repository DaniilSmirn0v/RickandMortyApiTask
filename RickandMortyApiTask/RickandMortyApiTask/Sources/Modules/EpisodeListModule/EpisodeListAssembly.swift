//
//  EpisodeListAssembly.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 25.11.2022.
//

import UIKit

class EpisodeListAssembly {
    static func createEpisodeModule() -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = EpisodeListInteractor(networkService: networkService)
        let router = EpisodeListRouter()
        let presenter = EpisodeListPresenter(interactor: interactor, router: router)
        let view = EpisodeListViewController(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter

        return view
    }
}
