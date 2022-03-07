//
//  UserEnpoint.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

struct UserEnpoint: Endpoint {
    let path: String = "/api"
    let queryItems: [URLQueryItem]
    let baseUrl: String
    private let results: Int
    private let seed: String?
    
    init(baseUrl: String, results: Int, seed: String?) {
        self.baseUrl = baseUrl
        self.results = results
        self.seed = seed
        
        self.queryItems = [
            URLQueryItem(name: "results", value: "\(results)"),
            URLQueryItem(name: "seed", value: seed)
        ]
    }
}
