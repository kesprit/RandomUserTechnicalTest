//
//  UserRemote+mock.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

@testable import RandomUserTechnicalTest

extension UserRemote {
    static var mock: UserRemote {
        .init(name: .init(first: "John", last: "Doe"), email: "jdoe@mail.com")
    }
}
