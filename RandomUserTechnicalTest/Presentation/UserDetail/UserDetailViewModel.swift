//
//  UserDetailViewModel.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

final class UserDetailViewModel {
    
    enum Section: Int, CaseIterable {
        case firstName
        case lastName
        case birthday
        case email
        case address
    }
    
    private let user: UserViewModel
    
    init(user: UserViewModel) {
        self.user = user
    }
    
    var title: String {
        user.username
    }
    
    var imageUrl: URL {
        .init(string: user.pictureStringUrl) ?? URL(fileURLWithPath: "")
    }
    
    func text(for section: Section) -> String {
        switch section {
            case .firstName:
                return "First Name"
            case .lastName:
                return "Last Name"
            case .birthday:
                return "Birthday"
            case .email:
                return "Email"
            case .address:
                return "Address"
        }
    }
    
    func value(for section: Section) -> String {
        switch section {
            case .firstName:
                return user.firstName
            case .lastName:
                return user.lastName
            case .birthday:
            return user.formattedBirthday
            case .email:
                return user.email
            case .address:
            return user.formattedAddress
        }
    }
    
    func picto(for section: Section) -> String {
        switch section {
            case .firstName:
                return "person.text.rectangle"
            case .lastName:
                return "person.text.rectangle"
            case .birthday:
                return "gift"
            case .email:
                return "person.crop.square.filled.and.at.rectangle"
            case .address:
                return "mappin.and.ellipse"
        }
    }
}

