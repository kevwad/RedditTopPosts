//
//  DIContainer.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import SwiftData

protocol DIContainer {
    var apiClient: APIClientAPI { get }
    var sharedModelContainer: ModelContainer { get }
}
