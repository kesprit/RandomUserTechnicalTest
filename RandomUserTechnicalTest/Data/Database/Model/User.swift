//
//  User.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation
import GRDB

struct User {
    let id: Int64?
    let firstname: String
    let lastname: String
    let email: String
    let gender: String
    let age: Int
    let birthday: Date
    let streetNumber: Int
    let streetName: String
    let city: String
    let state: String
    let pictureStringUrl: String
}

extension User: DatabaseRecord { }

