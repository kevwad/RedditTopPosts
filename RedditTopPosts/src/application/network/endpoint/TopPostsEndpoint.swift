//
//  TopPostsEndpoint.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation

struct TopPostsEndpoint: EndPoint {
    
    var path: String = Constants.URLs.topTravelPostsPath
    var httpMethod: String = Constants.HTTPMethods.get
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var httpBody: Data? = nil
    
}
