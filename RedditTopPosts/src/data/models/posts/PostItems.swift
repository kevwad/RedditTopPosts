//
//  PostItems.swift
//  RedditTopTravelOne
//
//  Created by Kevin Wadera on 2025-04-18.
//

import Foundation

struct PostItems: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let author: String
    let thumbnail: String
    let title: String
    
    enum Keys: String, CodingKey {
        case author
        case thumbnail
        case title
    }
}
