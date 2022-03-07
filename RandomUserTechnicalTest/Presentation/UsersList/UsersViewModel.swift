//
//  UsersViewModel.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

final class UsersViewModel: ObservableObject {
    @Published var users: [UserViewModel] = []
    
    private let userUseCase: UsersUseCaseProtocol
    
    init(userUseCase: UsersUseCaseProtocol) {
        self.userUseCase = userUseCase
    }
    
    func fetchUsers() { }
    
    func fetchMoreUsers() { }
}
