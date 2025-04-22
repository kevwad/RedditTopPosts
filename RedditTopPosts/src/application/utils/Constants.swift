//
//  Constants.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

struct Constants {
    static let apiKey = "YOUR_REDDIT_API_KEY_HERE"
    struct URLs {
        static let baseURL = "www.reddit.com"
        static let topTravelPostsPath = topPostsURL(for: "travel")
        
        static func topPostsURL(for postCategory: String) -> String {
            "/r/\(postCategory)/top.json"
        }
    }
    
    struct Protocols {
        static let http = "http"
        static let https = "https"
        static let file = "file"
    }
    
    struct HTTPMethods {
        static let get = "GET"
        static let put = "PUT"
        static let post = "POST"
        static let delete = "DELETE"
    }
}
