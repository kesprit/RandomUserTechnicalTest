//
//  LocalDataProviderProtocol.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import GRDB

protocol LocalDataProviderProtocol {
    associatedtype Model: DatabaseRecord
    func fetchAll() -> AnyPublisher<[Model], Error>
    func deleteAll() -> AnyPublisher<Int, Error>
    func insert(values: [Model]) -> AnyPublisher<[Model], Error>
}

typealias DatabaseRecord = Codable & FetchableRecord & PersistableRecord
