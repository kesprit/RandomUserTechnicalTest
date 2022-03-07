//
//  UserRemote+mock.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

@testable import RandomUserTechnicalTest

extension UserRemote {
    static var mock: UserRemote {
        .init(name: .init(first: "Doe", last: "Doe"),
              email: "jdoe@mail.com",
              gender: "male",
              phone: "555-555-555",
              dob: .init(date: "2017-01-27T08:05:07.092Z", age: 5),
              location: .init(street: .init(number: 2, name: "main street"),
                              city: "New York",
                              state: "USA"),
              picture: .init(large: "https://randomuser.me/api/portraits/men/35.jpg",
                             medium: "https://randomuser.me/api/portraits/men/35.jpg",
                             thumbnail: "https://randomuser.me/api/portraits/men/35.jpg"))
    }
}
