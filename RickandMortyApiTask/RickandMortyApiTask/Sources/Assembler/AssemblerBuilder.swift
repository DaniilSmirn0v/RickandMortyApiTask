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
}

// MARK: - AssemblyBuilder

class AssemblerBuilder: AssemblyBuilderProtocol {

    func configureCharactersListModule() -> UIViewController {
        let network = DefaultNetworkClient()
        let presenter = CharactersListPresenter()
        let interactor = CharactersListInteractor(network: network, presenter: presenter)
        let view = CharactersListViewController(presenter: presenter)
        let router = CharactersListRouter(viewController: view, assemblyBuilder: self)

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        return view
    }
    
    func configureDetailCharactertModule(_ id: Int) -> UIViewController {
        let network = DefaultNetworkClient()
        let presenter = DetailCharacterPresenter(id: id)

        let interactor = DetailCharacterInteractor(network: network, presenter: presenter)
        let view = DetailCharactertViewController(presenter: presenter)

        presenter.interactor = interactor
        presenter.view = view

        return view
    }
}

