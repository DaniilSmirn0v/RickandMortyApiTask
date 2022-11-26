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
        let view = CharactersListViewController()
        let router = CharactersListRouter(viewController: view, assemblyBuilder: self)
        let presenter: CharactersListViewOutputProtocol & CharactersListInteractorOutputProtocol = CharactersListPresenter()
        view.presenter = presenter
        view.presenter?.router = router
        view.presenter?.interactor = CharactersListInteractor(network: network)
        view.presenter?.interactor?.presenter = presenter
        return view
    }
    
    func configureDetailCharactertModule(_ id: Int) -> UIViewController {
        let network = DefaultNetworkClient()
        let view = DetailCharactertViewController()
        let presenter: DetailCharacterViewOutputProtocol & DetailCharactertInteractorOutputProtocol = DetailCharacterPresenter()
        view.presenter = presenter
        view.presenter?.interactor = DetailCharacterInteractor(network: network, id: id)
        view.presenter?.interactor?.presenter = presenter
        return view
    }
}

