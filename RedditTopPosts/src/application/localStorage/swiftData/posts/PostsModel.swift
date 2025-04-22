//
//  PostsModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import Foundation
import SwiftData

@Model
final class PostsModel {
    var data: PostDataModel
    
    init(data: PostDataModel) {
        self.data = data
    }
}
