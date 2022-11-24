//
//  BaseRouter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import UIKit
// MARK: - BaseRouterProtocol

protocol BaseRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

class BaseRouter: BaseRouterProtocol {
    // MARK: - Properties

    var assemblyBuilder: AssemblyBuilderProtocol?
    var navigationController: UINavigationController?

    // MARK: - Initialization

    init(navigationController: UINavigationController,
         assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

}
