//
//  RemoteDataProvider.swift
//  RandomUserTechnicalTest
//
//  Created by Kévin Esprit on 07/03/2022.
//

import Combine
import Foundation

struct RemoteDataProvider<T: Decodable>: RemoteDataProviderProtocol {
    typealias Model = T
    
    func fetchData(from endpoint: Endpoint, session: URLSession = .shared) -> AnyPublisher<T, Error> {
        session.dataTaskPublisher(for: endpoint.url ?? URL(fileURLWithPath: ""))
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
