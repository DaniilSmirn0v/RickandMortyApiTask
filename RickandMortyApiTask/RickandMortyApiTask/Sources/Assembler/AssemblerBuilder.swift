//
//  AssemblerBuilder.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import UIKit
// MARK: - AssemblyBuilderProtocol

protocol AssemblyBuilderProtocol {
    func configureCharactersListModule() -> UIViewController
    func configureDetailCharactertModule(_ id: Int) -> UIViewController
    func configureEpisodeListModule() -> UIViewController
    func configureEpisodeDetailModule(_ id: Int) -> UIViewController
    func configureLocationListModule() -> UIViewController
    func configureLocationDetailModule(_ id: Int) -> UIViewController
}

// MARK: - AssemblyBuilder

class AssemblerBuilder: AssemblyBuilderProtocol {

    func configureCharactersListModule() -> UIViewController {
        let network = DefaultNetworkClient()
        let view = CharactersListViewController()
        let router = CharactersListRouter(viewController: view, assemblyBuilder: self)
        let presenter = CharactersListPresenter()
        let interactor = CharactersListInteractor(network: network)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    func configureDetailCharactertModule(_ id: Int) -> UIViewController {
        let network = DefaultNetworkClient()
        let view = DetailCharactertViewController()
        let router = DetailCharacterRouter(viewController: view, assemblyBuilder: self)
        let interactor = DetailCharacterInteractor(network: network)
        let presenter = DetailCharacterPresenter(id: id)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }

    func configureEpisodeListModule() -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = EpisodeListInteractor(networkService: networkService)
        let view = EpisodeListViewController()
        let router = EpisodeListRouter(viewController: view, assemblyBuilder: self)
        let presenter = EpisodeListPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }

    func configureEpisodeDetailModule(_ id: Int) -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = EpisodeDetailInteractor(networkService: networkService, id: id)
        let view = EpisodeDetailViewController()
        let router = EpisodeDetailRouter(viewController: view, assemblyBuilder: self)
        let presenter = EpisodeDetailPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }

    func configureLocationListModule() -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = LocationListInteractor(networkService: networkService)
        let view = LocationListViewController()
        let router = LocationListRouter(viewController: view, assemblyBuilder: self)
        let presenter = LocationListPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }

    func configureLocationDetailModule(_ id: Int) -> UIViewController {
        let networkService = DefaultNetworkClient()
        let interactor = LocationDetailInteractor(networkService: networkService, id: id)
        let view = LocationDetailViewController()
        let router = LocationDetailRouter(viewController: view, assemblyBuilder: self)
        let presenter = LocationDetailPresenter(interactor: interactor, router: router)
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter

        return view
    }
}

