//
//  UserRemoteRepositoryProtocol.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

protocol UserRemoteRepositoryProtocol {
    func fetchUsers() -> AnyPublisher<[UserRemote], Error>
}
