//
//  NetworkLayer.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import Foundation
import Combine

class MovieAPI {
    static let shared = MovieAPI()
    private let apiKey = AppURLs.apiKey
    private let baseURL = AppURLs.apiBaseURL
    
    func fetchMovies(endpoint: String) -> AnyPublisher<[MovieAPIModel], Error> {
        guard let url = URL(string: "\(baseURL)\(endpoint)?api_key=\(apiKey)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MoviesResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct MoviesResponse: Codable {
    let results: [MovieAPIModel]
}

