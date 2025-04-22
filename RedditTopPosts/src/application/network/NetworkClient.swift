//
//  NetworkClient.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation

class NetworkClient: APIClientAPI {
    static let shared = NetworkClient()
    private init() {}
    private let session: URLSession = .shared
    
    func get<T: Codable>(request: URLRequest) async throws -> T? {
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else { throw URLError(.badServerResponse)  }
        guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
            throw URLError(.unknown)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
