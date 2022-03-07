//
//  UserViewModel.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

struct UserViewModel {
    let firstName: String
    let lastName: String
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

extension UserViewModel {
    var username: String {
        "\(firstName) \(lastName)"
    }
    
    var formattedBirthday: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: birthday)
    }
    
    var formattedAddress: String {
        "\(streetNumber)" + " " + streetName + ", " + city
    }
    
    var profile: String {
        .init("👩‍🦳👳🏼‍♂️👶👧🏽🧔🏻‍♀️🧑🏿‍🦲👱🏼‍♀️👨🏻‍🦰👴🏼👲🏼🧑🏿‍🦰👱🏿‍♂️".randomElement()!)
    }
}
