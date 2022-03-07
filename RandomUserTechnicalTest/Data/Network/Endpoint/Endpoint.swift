//
//  Endpoint.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var url: URL? { get }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents(string: baseUrl)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}
