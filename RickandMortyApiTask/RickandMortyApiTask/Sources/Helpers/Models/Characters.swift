//
//  Characters.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 22.11.2022.
//

import Foundation

struct Characters: Hashable, Identifiable {

    let name: String
    let id = UUID()
//    func hash(into hasher: inout Hasher) {
//      hasher.combine(name)
//    }
    static func == (lhs: Characters, rhs: Characters) -> Bool {
        lhs.id  == rhs.id
    }
}

enum Section {
  case main
}
