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

    func getCharacterInfo() -> Character?
    func getCharacterName() -> String
}

protocol DetailCharacterViewInputProtocol: AnyObject  {
  
}

