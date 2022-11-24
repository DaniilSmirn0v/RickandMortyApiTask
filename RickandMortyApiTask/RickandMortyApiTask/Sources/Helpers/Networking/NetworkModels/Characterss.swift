//
//  Characterss.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation
import UIKit

// MARK: - Welcome
struct Characterss: Decodable {
    let info: Info
    let results: [Results]
}

// MARK: - Info
struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
}

// MARK: - Result
struct Results: Decodable, Hashable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let image: String
    var statusColor: String {
        switch status {
        case .alive:
            return "🟢"
        case .dead:
            return "🔴"
        case .unknown:
            return "⚪️"
        }
    }
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - CharactInfo  // НЕ УДАЛЯТЬ!!!!!!!!!!!!!!!!

struct CharactInfo: Hashable {
    var status: String
    var info: String
}
