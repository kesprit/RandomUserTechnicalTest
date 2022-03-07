//
//  UsersUseCase.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine

final class UsersUseCase: UsersUseCaseProtocol {
    
    private let userRemoteDataRepository: UserRemoteRepositoryProtocol
    private let userLocalDataRepository: UserLocalRepositoryProtocol
    private var cancelable = [AnyCancellable]()
    
    init(userRemoteDataRepository: UserRemoteRepositoryProtocol, userLocalDataRepository: UserLocalRepositoryProtocol) {
        self.userLocalDataRepository = userLocalDataRepository
        self.userRemoteDataRepository = userRemoteDataRepository
    }
    
    func fetchUsers(clearData: Bool) -> AnyPublisher<[UserViewModel], Error> {
        userRemoteDataRepository
            .fetchUsers()
            .handleEvents(receiveOutput: { [weak self] users in
                if clearData {
                    self?.resetDatabase(users)
                }
            })
            .map(convertToViewModel)
            .catch(handleErrorForFetchUsers)
                    .eraseToAnyPublisher()
    }
    
    private func resetDatabase(_ users: [UserRemote]) {
        userLocalDataRepository
            .deleteAllUsers()
            .combineLatest(userLocalDataRepository.insertUsers(users: users.map(ModelConverter.convert)))
            .sink { _ in
            } receiveValue: {_ in
            }.store(in: &cancelable)
    }
    
    private func saveInDatabase(_ users: [UserRemote]) {
        userLocalDataRepository
            .insertUsers(users: users.map(ModelConverter.convert))
            .sink { _ in
            } receiveValue: { _ in
            }.store(in: &cancelable)
    }
    
    // MARK: Utils methods
    private func convertToViewModel(_ remote: [UserRemote]) -> [UserViewModel] {
        remote.map(ModelConverter.convert)
    }
    
    private func convertToViewModel(_ remote: [User]) -> [UserViewModel] {
        remote.map(ModelConverter.convert)
    }
    
    private func handleErrorForFetchUsers(_ error: Error) -> AnyPublisher<[UserViewModel], Error> {
        userLocalDataRepository
            .fetchAllUsers()
            .map(convertToViewModel)
            .eraseToAnyPublisher()
    }
    
    private func handleErrorForFetchMoreUsers(_ error: Error) -> AnyPublisher<[UserViewModel], Error> {
        .init(CurrentValueSubject<[UserViewModel], Error>([]))
    }
}

