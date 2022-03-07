//
//  UserViewModel+equatable.swift
//  RandomUserTechnicalTestTests
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation
@testable import RandomUserTechnicalTest

extension UserViewModel: Equatable {
    public static func == (lhs: UserViewModel, rhs: UserViewModel) -> Bool {
        lhs.username == rhs.username
    }
}
