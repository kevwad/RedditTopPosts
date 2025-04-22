//
//  EndPoint.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation

protocol EndPoint {
    
    var httpMethod: String { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    var path: String { get }
    var httpBody: Data? { get }
    
    func urlRequest() -> URLRequest?
    func absolutePath() -> String?
}

extension EndPoint {
    func absolutePath() -> String? {
        urlRequest()?.url?.absoluteString
    }
    
    func urlRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = Constants.Protocols.https
        components.host = Constants.URLs.baseURL
        components.path = path
        components.queryItems = queryItems
        
        
        guard let finalUrl = components.url else { return nil }
        var request = URLRequest(url: finalUrl)
        request.httpMethod = httpMethod
        for header in headers ?? [:] {
            request.addValue(header.1, forHTTPHeaderField: header.0)
        }
        
        return request
    }
}
