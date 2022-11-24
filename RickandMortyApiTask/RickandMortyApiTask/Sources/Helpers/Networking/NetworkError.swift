//
//  NetworkError.swift
//  RickandMortyApiTask
//
//  Created by Даниил Смирнов on 24.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidStatusCode(_ statusCode: Int)
    case emptyData
    case decoding(_ error: Error)
    case unknown(_ error: Error)
}
