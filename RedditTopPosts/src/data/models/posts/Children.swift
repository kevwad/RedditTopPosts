//
//  Children.swift
//  RedditTopTravelOne
//
//  Created by Kevin Wadera on 2025-04-18.
//

struct Children: Codable {
    let data: PostItems
    
    enum Keys: String, CodingKey {
        case data = "data"
    }
}
