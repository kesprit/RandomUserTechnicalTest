//
//  RemoteDataProviderProtocol.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import Foundation

protocol RemoteDataProviderProtocol {
    associatedtype Model: Decodable
    func fetchData(from endpoint: Endpoint, session: URLSession) -> AnyPublisher<Model, Error>
}
