//
//  CategoriesModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import SwiftData
import Foundation

@Model
final class CategoriesModel {
    @Attribute(.unique) var category: String
    var postItems: [PostItems]
    
    init(category: String, postItems : [PostItems]) {
        self.category = category
        self.postItems = postItems
    }
}
