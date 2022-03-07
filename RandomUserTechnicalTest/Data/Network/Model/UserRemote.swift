//
//  UserRemote.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

struct UserRemote: Decodable {
    let name: Name
    let email: String
    let gender: String
    let phone: String
    let dob: Birthday
    let location: Location
    let picture: Picture
    
    struct Name: Decodable {
        let first: String
        let last: String
    }
    
    struct Birthday: Decodable {
        let date: String
        let age: Int
    }
    
    struct Location: Decodable {
        let street: Street
        let city: String
        let state: String
        
        struct Street: Decodable {
            let number: Int
            let name: String
        }
    }
    
    struct Picture: Decodable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}

