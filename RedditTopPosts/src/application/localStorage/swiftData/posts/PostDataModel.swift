//
//  PostDataModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import Foundation
import SwiftData

@Model
final class PostDataModel {
    var children: [ChildrenModel]
    
    init(children: [ChildrenModel]) {
        self.children = children
    }
}
