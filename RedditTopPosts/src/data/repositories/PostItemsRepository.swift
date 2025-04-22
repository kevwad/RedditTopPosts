//
//  PostItemsRepository.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Foundation
import SwiftData

class PostItemsRepository: LocalStorageAPI {
    let apiClient: APIClientAPI
    let category: String
    let modelContext: ModelContext

    init(apiClient: APIClientAPI, modelContext: ModelContext, category: String) {
        self.apiClient = apiClient
        self.category = category
        self.modelContext = modelContext
    }
    
    func getPosts() async throws -> [PostItems] {
        /// 1. check local storage availability
        let allStoredPosts = await storedPosts()
        if let storedPosts = allStoredPosts, !storedPosts.isEmpty {
            print("successfully fetched \(storedPosts.count) stored posts for \(self.category)")
            return storedPosts
        }

        /// 2. request remote storage access
        let endpoint = TopPostsEndpoint(path: Constants.URLs.topPostsURL(for: category))
        guard let urlRequest = endpoint.urlRequest() else { throw URLError(.badURL) }
        guard let posts: Posts = try await apiClient.get(request: urlRequest) else { throw APIError.noData }
        return posts.data.children.compactMap(\.data)
    }
    
    @MainActor
    func storedPosts() async -> [PostItems]? {
        return try? getLocallyStoredObject( CategoriesModel.self )
            .filter {
                $0.category == self.category
            }
            .map(\.postItems)
            .first
    }
}
