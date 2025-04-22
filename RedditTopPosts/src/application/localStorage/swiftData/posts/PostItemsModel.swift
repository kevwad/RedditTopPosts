//
//  PostItemsModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import Foundation
import SwiftData

@Model
final class PostItemsModel {
    @Attribute(.unique) var id: String
    var author: String
    var thumbnail: String
    var title: String
    
    init(id: String, author: String, thumbnail: String, title: String) {
        self.id = id
        self.author = author
        self.thumbnail = thumbnail
        self.title = title
    }
    
    convenience init (from postItems: PostItems) throws {
        self.init(id: postItems.id,
                  author: postItems.author,
                  thumbnail: postItems.thumbnail,
                  title: postItems.title)
    }
}
