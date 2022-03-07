//
//  AppDependencies.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

final class AppDependencies {
    private let baseUrl: String
    private let results: Int
    private let seed: String
    
    init(baseUrl: String, results: Int, seed: String) {
        self.baseUrl = baseUrl
        self.results = results
        self.seed = seed
    }
    
    lazy var config: RemoteConfiguration = .init(baseUrl: baseUrl, results: results, seed: seed)
    lazy var remoteDataProvider = RemoteDataProvider<UserRemoteResponse>()
    lazy var userRemoteDataRepository = UserRemoteRepository(remoteDataProvider: remoteDataProvider,
                                                             config: config)
    lazy var userLocalRepository = UserLocalRepository(database: .current)
    lazy var userUseCase = UsersUseCase(userRemoteDataRepository: userRemoteDataRepository,
                                        userLocalDataRepository: userLocalRepository)
}

