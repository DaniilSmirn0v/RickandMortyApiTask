//
//  BaseRouter.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import UIKit

class BaseRouter {
    // MARK: - Properties

    var assemblyBuilder: AssemblyBuilderProtocol?
    var viewController: UIViewController?

    // MARK: - Initialization

    init(viewController: UIViewController,
         assemblyBuilder: AssemblyBuilderProtocol) {
        self.viewController = viewController
        self.assemblyBuilder = assemblyBuilder
    }

}
