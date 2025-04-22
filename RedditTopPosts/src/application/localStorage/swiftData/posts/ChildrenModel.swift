//
//  ChildrenModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import Foundation
import SwiftData

@Model
final class ChildrenModel {
    var data: PostItemsModel
    
    init(data: PostItemsModel) {
        self.data = data
    }
}
