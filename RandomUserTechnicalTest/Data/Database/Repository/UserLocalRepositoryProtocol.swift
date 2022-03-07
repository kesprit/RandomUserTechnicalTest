//
//  UserLocalRepositoryProtocol.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

protocol UserLocalRepositoryProtocol {
    func fetchAllUsers() -> AnyPublisher<[User], Error>
    func deleteAllUsers() -> AnyPublisher<Int, Error>
    func insertUsers(users: [User]) -> AnyPublisher<[User], Error>
}
