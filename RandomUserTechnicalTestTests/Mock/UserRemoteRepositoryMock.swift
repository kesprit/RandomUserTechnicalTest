//
//  UserRemoteRepositoryMock.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
@testable import RandomUserTechnicalTest

final class UserRemoteRepositoryMock: UserRemoteRepositoryProtocol {
    var fetchUsersClosure: () -> AnyPublisher<[UserRemote], Error>
    
    init(fetchUsersClosure: @escaping () -> AnyPublisher<[UserRemote], Error>) {
        self.fetchUsersClosure = fetchUsersClosure
    }
    
    func fetchUsers() -> AnyPublisher<[UserRemote], Error> {
        fetchUsersClosure()
    }
    
    enum MockError: Error {
        case fetchUsersError
    }
    
    static var successRepository: UserRemoteRepositoryMock {
        .init(fetchUsersClosure: {
            Future<[UserRemote], Error> { promise in
                promise(.success([.mock]))
            }
            .eraseToAnyPublisher()
        })
    }
    
    static var failRepository: UserRemoteRepositoryMock {
        .init(fetchUsersClosure: {
            Future<[UserRemote], Error> { promise in
                promise(.failure(MockError.fetchUsersError))
            }
            .eraseToAnyPublisher()
        })
    }
}

