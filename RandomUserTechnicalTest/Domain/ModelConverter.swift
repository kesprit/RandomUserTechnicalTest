//
//  ModelConverter.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

enum ModelConverter {
    static func convert(_ userRemote: UserRemote) -> User {
        .init(id: nil,
              firstname: userRemote.name.first,
              lastname: userRemote.name.last,
              email: userRemote.email,
              gender: userRemote.gender,
              age: userRemote.dob.age,
              birthday: DateFormatter().date(from: userRemote.dob.date) ?? Date(),
              streetNumber: userRemote.location.street.number,
              streetName: userRemote.location.street.name,
              city: userRemote.location.city,
              state: userRemote.location.state,
              pictureStringUrl: userRemote.picture.large)
    }
    
    static func convert(_ user: User) -> UserViewModel {
        .init(firstName: user.firstname,
              lastName: user.lastname,
              email: user.email,
              gender: user.gender,
              age: user.age,
              birthday: user.birthday,
              streetNumber: user.streetNumber,
              streetName: user.streetName,
              city: user.city,
              state: user.state,
              pictureStringUrl: user.pictureStringUrl)
    }
    
    static func convert(_ user: UserRemote) -> UserViewModel {
        .init(firstName: user.name.first,
              lastName: user.name.last,
              email: user.email,
              gender: user.gender,
              age: user.dob.age,
              birthday: DateFormatter().date(from: user.dob.date) ?? Date(),
              streetNumber: user.location.street.number,
              streetName: user.location.street.name,
              city: user.location.city,
              state: user.location.state,
              pictureStringUrl: user.picture.large)
    }
}

