//
//  UsersUseCaseTests.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import XCTest
@testable import RandomUserTechnicalTest

class UsersUseCaseTests: XCTestCase {
    var successUseCase: UsersUseCaseProtocol!
    var failureUseCase: UsersUseCaseProtocol!
    var cancellables = [AnyCancellable]()
    
    override func setUpWithError() throws {
        successUseCase = UsersUseCase(userRemoteDataRepository: UserRemoteRepositoryMock.successRepository,
                                      userLocalDataRepository: UserLocalRepositoryMock.successRepository)
        failureUseCase = UsersUseCase(userRemoteDataRepository: UserRemoteRepositoryMock.failRepository,
                                      userLocalDataRepository: UserLocalRepositoryMock.failRepository)
        cancellables = []
    }
    
    func testUsersUsecase_fetchUsers_success() {
        // GIVEN
        // WHEN
        let expectedValue: UserViewModel = ModelConverter.convert(User.mock)
        
        // THEN
        publishOneValueThenFinish(expectationDescription: "Fetch users then get an array with one user",
                                  publisher: successUseCase.fetchUsers(clearData: true),
                                  expectedValue: [expectedValue],
                                  cancellables: &cancellables)
    }
    
    func testUsersUsecase_fetchUsers_failure() {
        // GIVEN
        // WHEN
        let expectedError: UserLocalRepositoryMock.MockError = .fetchAllUsers
        
        // THEN
        publishOneValueThenFail(expectationDescription: "Fetch users then fails with fetchAllUsers Error",
                                publisher: failureUseCase.fetchUsers(clearData: true),
                                expectedValue: [ModelConverter.convert(User.mock)],
                                expectedError: expectedError,
                                cancellables: &cancellables)
    }
}

