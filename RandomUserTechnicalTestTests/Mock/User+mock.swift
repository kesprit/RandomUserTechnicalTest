//
//  User+mock.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation
@testable import RandomUserTechnicalTest

extension User {
    static var mock: User {
        .init(id: 1,
              firstname: "John",
              lastname: "Doe",
              email: "jdoe@mail.com",
              gender: "male",
              age: 24,
              birthday: Date(timeIntervalSince1970: 100_000_000),
              streetNumber: 2,
              streetName: "main street",
              city: "New York",
              state: "USA",
              pictureStringUrl: "https://randomuser.me/api/portraits/men/35.jpg")
    }
}
