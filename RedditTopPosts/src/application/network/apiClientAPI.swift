//
//  apiClient.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation

protocol APIClientAPI {
    func get<T: Codable>(request: URLRequest) async throws -> T?
}
