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
 }

 extension UserViewModel {
     var username: String {
         "\(firstName) \(lastName)"
     }

     var profile: String {
         .init("👩‍🦳👳🏼‍♂️👶👧🏽🧔🏻‍♀️🧑🏿‍🦲👱🏼‍♀️👨🏻‍🦰👴🏼👲🏼🧑🏿‍🦰👱🏿‍♂️".randomElement()!)
     }
 }

 #warning("This extension should be delete")
 extension UserViewModel {
     static var mock: UserViewModel {
         .init(firstName: "John", lastName: "Doe", email: "jdo@mail.com")
     }
 }
