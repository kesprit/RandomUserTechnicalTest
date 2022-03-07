//
//  XCTestCase+extension.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import XCTest

extension XCTestCase {
    func publishOneValueThenFinish<Output: Equatable>(expectationDescription: String,
                                                      publisher: AnyPublisher<Output, Error>,
                                                      expectedValue: Output,
                                                      cancellables: inout [AnyCancellable]) {
        let expectation = XCTestExpectation(description: expectationDescription)
        var values: [Output] = []
        publisher
            .sink(receiveCompletion: { completion in
                guard case .finished = completion else { return }
                expectation.fulfill()
            }, receiveValue: { value in
                guard values.isEmpty else {
                    return XCTFail("Expected to receive only one value, got another: (\(value))")
                }
                XCTAssertEqual(value, expectedValue)
                values.append(value)
                expectation.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
    
    func publishOneValueThenFail<Output: Equatable, ExpectError: Equatable, Error>(expectationDescription: String,
                                                                                   publisher: AnyPublisher<Output, Error>,
                                                                                   expectedValue: Output,
                                                                                   expectedError: ExpectError,
                                                                                   cancellables: inout [AnyCancellable]) {
        let expectation = XCTestExpectation(description: expectationDescription)
        var values: [Output] = []
        publisher
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTAssertEqual(error as! ExpectError, expectedError)
                expectation.fulfill()
            }, receiveValue: { value in
                guard values.isEmpty else {
                    return XCTFail("Expected to receive only one value, got another (\(value))")
                }
                XCTAssertEqual(value, expectedValue)
                values.append(value)
            })
            .store(in: &cancellables)
        wait(for: [expectation], timeout: 1)
    }
}

