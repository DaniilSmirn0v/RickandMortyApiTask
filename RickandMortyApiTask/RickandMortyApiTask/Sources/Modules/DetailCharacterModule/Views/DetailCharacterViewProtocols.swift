//
//  DetailCharacterViewProtocols.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 24.11.22.
//

import Foundation

protocol DetailCharacterViewOutputProtocol {
    var view: DetailCharacterViewInputProtocol? { get set }
    var interactor: DetailCharacterInteractorInputProtocol? { get set }
    var router: DetailCharacterRouterProtocol? { get set }
  
    func getCharacter() -> Character?
}

protocol DetailCharacterViewInputProtocol: AnyObject  {
    var presenter: DetailCharacterViewOutputProtocol? { get set }
    func configure(with viewModelsCell: ViewModel, data: Character, with tableViewModelCell: [ViewModel])
}

