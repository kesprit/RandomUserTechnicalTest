//
//  UserLocalRepositoryMock.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
@testable import RandomUserTechnicalTest

final class UserLocalRepositoryMock: UserLocalRepositoryProtocol {
    var fetchAllUsersClosure: () -> AnyPublisher<[User], Error>
    var deleteAllUsersClosure: () -> AnyPublisher<Int, Error>
    var insertUsersClosure: ([User]) -> AnyPublisher<[User], Error>
    
    init(fetchAllUsersClosure: @escaping () -> AnyPublisher<[User], Error>,
         deleteAllUsersClosure: @escaping () -> AnyPublisher<Int, Error>,
         insertUsersClosure: @escaping ([User]) -> AnyPublisher<[User], Error>) {
        self.fetchAllUsersClosure = fetchAllUsersClosure
        self.deleteAllUsersClosure = deleteAllUsersClosure
        self.insertUsersClosure = insertUsersClosure
    }
    
    func fetchAllUsers() -> AnyPublisher<[User], Error> {
        fetchAllUsersClosure()
    }
    
    func deleteAllUsers() -> AnyPublisher<Int, Error> {
        deleteAllUsersClosure()
    }
    
    func insertUsers(users: [User]) -> AnyPublisher<[User], Error> {
        insertUsersClosure(users)
    }
    
    static var successRepository: UserLocalRepositoryMock {
        .init {
            Future<[User], Error> { promise in
                promise(.success([.mock]))
            }
            .eraseToAnyPublisher()
        } deleteAllUsersClosure: {
            Future<Int, Error> { promise in
                promise(.success(1))
            }
            .eraseToAnyPublisher()
        } insertUsersClosure: { users in
            Future<[User], Error> { promise in
                promise(.success(users))
            }
            .eraseToAnyPublisher()
        }
    }
    
    static var failRepository: UserLocalRepositoryMock {
        .init {
            Future<[User], Error> { promise in
                promise(.failure(MockError.fetchAllUsers))
            }
            .eraseToAnyPublisher()
        } deleteAllUsersClosure: {
            Future<Int, Error> { promise in
                promise(.failure(MockError.deleteAllUsers))
            }
            .eraseToAnyPublisher()
        } insertUsersClosure: { users in
            Future<[User], Error> { promise in
                promise(.failure(MockError.insertUsers))
            }
            .eraseToAnyPublisher()
        }
    }
    
    enum MockError: Error {
        case fetchAllUsers
        case deleteAllUsers
        case insertUsers
    }
}


