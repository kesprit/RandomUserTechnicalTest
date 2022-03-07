//
//  UserRemoteRepository.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import Foundation

struct UserRemoteRepository: UserRemoteRepositoryProtocol {
    private let remoteDataProvider: RemoteDataProvider<UserRemoteResponse>
    private let urlSession: URLSession
    private let config: RemoteConfiguration
    
    init(remoteDataProvider: RemoteDataProvider<UserRemoteResponse>,
         urlSession: URLSession = .shared,
         config: RemoteConfiguration) {
        self.remoteDataProvider = remoteDataProvider
        self.urlSession = urlSession
        self.config = config
    }
    
    func fetchUsers() -> AnyPublisher<[UserRemote], Error> {
        remoteDataProvider
            .fetchData(from: .users(baseUrl: config.baseUrl,
                                    results: config.results),
                       session: .shared)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}

