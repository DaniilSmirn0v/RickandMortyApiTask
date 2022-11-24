//
//  NetworkClient.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

public protocol NetworkClient {
    func perform<T: Decodable>(request: URLRequest) async throws -> T
}
