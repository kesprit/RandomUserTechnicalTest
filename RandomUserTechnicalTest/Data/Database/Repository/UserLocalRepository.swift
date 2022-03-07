//
//  UserLocalRepository.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

struct UserLocalRepository: UserLocalRepositoryProtocol {
    private let localDataProvider: LocalDataProvider<User>

    init(database: UsersDatabase) {
        self.localDataProvider = .init(dbWriter: database.dbWriter)
    }
    
    func fetchAllUsers() -> AnyPublisher<[User], Error> {
        localDataProvider.fetchAll()
    }
    
    func deleteAllUsers() -> AnyPublisher<Int, Error> {
        localDataProvider.deleteAll()
    }
    
    func insertUsers(users: [User]) -> AnyPublisher<[User], Error> {
        localDataProvider.insert(values: users)
    }
}

