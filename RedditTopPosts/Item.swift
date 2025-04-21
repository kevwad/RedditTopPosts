//
//  Item.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
