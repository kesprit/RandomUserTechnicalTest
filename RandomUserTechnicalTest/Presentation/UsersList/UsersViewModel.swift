//
//  UsersViewModel.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

 final class UsersViewModel: ObservableObject {
     @Published var users: [UserViewModel] = [.mock, .mock]
     
     init() { }
 }
