//
//  UsersUseCaseProtocol.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

protocol UsersUseCaseProtocol {
    func fetchUsers(clearData: Bool) -> AnyPublisher<[UserViewModel], Error>
}
