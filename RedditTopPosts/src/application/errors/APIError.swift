//
//  APIError.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

enum APIError: Error {
    case noData
    case jsonDecodeFailed
    case urlSessionFailed
    case invalidResponse
    case statusCode(Int)
}
