//
//  DependencyInjectionContainer.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import SwiftData

struct DependencyInjectionContainer: DIContainer {
    var apiClient: any APIClientAPI = NetworkClient.shared
    
    var sharedModelContainer: ModelContainer = {
        let schema = DependencyInjectionContainer.allSchemas
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    static let allSchemas = Schema([
        Item.self,
        PostsModel.self,
        PostItemsModel.self,
        ChildrenModel.self,
        PostDataModel.self,
        CategoriesModel.self,
    ])
}
