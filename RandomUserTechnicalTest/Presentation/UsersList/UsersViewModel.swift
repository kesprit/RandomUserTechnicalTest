//
//  UsersViewModel.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

final class UsersViewModel: ObservableObject {
    @Published var users: [UserViewModel] = []
    @Published var isLoading = false
    @Published var showError = false
    
    let genericErrorTitle: String = "Error"
    let genericErrorMessage: String = "Something wrong"
    let genericErrorActionTitle: String = "Retry"
    
    private let userUseCase: UsersUseCaseProtocol
    private var cancelable: AnyCancellable?
    
    init(userUseCase: UsersUseCaseProtocol) {
        self.userUseCase = userUseCase
    }
    
    func fetchUsers() {
        guard !isLoading else { return }
        isLoading = true
        cancelable = userUseCase
            .fetchUsers(clearData: true)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.showError = true
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] users in
                self?.users = users
                self?.isLoading = false
            }
    }
    
    func fetchMoreUsers() {
        guard !isLoading else { return }
        isLoading = true
        cancelable = userUseCase
            .fetchUsers(clearData: false)
            .sink { [weak self] completion in
                if case .failure = completion {
                    self?.showError = true
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] users in
                self?.users.append(contentsOf: users)
                self?.isLoading = false
            }
    }
}
