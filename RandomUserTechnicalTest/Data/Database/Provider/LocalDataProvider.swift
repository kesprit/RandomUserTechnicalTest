//
//  LocalDataProvider.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import GRDB

struct LocalDataProvider<T: DatabaseRecord>: LocalDataProviderProtocol {
    private let dbWriter: DatabaseWriter
    typealias Model = T
    
    init(dbWriter: DatabaseWriter) {
        self.dbWriter = dbWriter
    }
    
    func fetchAll() -> AnyPublisher<[T], Error> {
        dbWriter.readPublisher { database in
            try T.fetchAll(database)
        }.eraseToAnyPublisher()
    }
    
    func insert(values: [T]) -> AnyPublisher<[T], Error> {
        dbWriter.writePublisher { database in
            try values.forEach {
                try $0.insert(database)
            }
            return values
        }.eraseToAnyPublisher()
    }
    
    func deleteAll() -> AnyPublisher<Int, Error> {
        dbWriter.writePublisher { database in
            try T.deleteAll(database)
        }
        .eraseToAnyPublisher()
    }
}
