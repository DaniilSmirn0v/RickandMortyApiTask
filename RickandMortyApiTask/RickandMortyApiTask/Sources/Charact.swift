//
//  Characters.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 22.11.22.
//

import Foundation

struct Charact: Hashable {

    let name: String
    let id = UUID()
//    func hash(into hasher: inout Hasher) {
//      hasher.combine(name)
//    }
//    static func == (lhs: Characters, rhs: Characters) -> Bool {
//        lhs.id  == rhs.id
//    }
}

struct Apple: Hashable {
    var name: String
}

struct Orange: Hashable {
    var name: String
}

enum Section {
  case main
}


