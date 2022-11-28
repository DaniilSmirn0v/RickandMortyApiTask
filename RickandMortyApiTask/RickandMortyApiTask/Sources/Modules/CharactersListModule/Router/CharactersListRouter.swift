//
//  CharactersListRouter.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import UIKit

final class CharactersListRouter: BaseRouter, CharactersListRouterProtocol {
    // MARK: - Methods
    
    func openDetailCharactertVC(_ id: Int) {
        guard let detailCharactertVC = assemblyBuilder?.configureDetailCharactertModule(id) else { return }
        viewController?.navigationController?.pushViewController(detailCharactertVC, animated: true)
    }
    
}
