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
    var modelContext: ModelContext? = nil
    var modelContainer: ModelContainer? = nil

    init(apiClient: APIClientAPI, category: String) {
        self.apiClient = apiClient
        self.category = category
        
        Task {
            do {
                let configuration = ModelConfiguration(isStoredInMemoryOnly: false)
                let container = try ModelContainer(
                    for: CategoriesModel.self,
                    configurations: configuration
                )
                self.modelContainer = container
                self.modelContext = ModelContext(container)
                self.modelContext?.autosaveEnabled = true
            } catch(let error) {
                print(error)
                print(error.localizedDescription)
            }
        }
    }
    
    func getPosts() async throws -> [PostItems] {
        do {
            /// 1. check local storage availability
            let storedPosts = try await requestLocallyStoredPosts()
            print("successfully fetched \(storedPosts.count) stored posts for \(self.category)")
            return storedPosts
        } catch LocalStorageRetrieverError.noObjectFound {
            
            /// 2. request remote storage access
            let postItems = try await requestRemotePosts()

            /// ensure that the received category is a valid
            assert(Categories(rawValue: self.category) != nil)
            
            /// 3. dump to db
            persistPostItems(postItems)

            return postItems
        } catch {
            print(error.localizedDescription)
            throw error
        } 
    }

    func requestLocallyStoredPosts() async throws -> [PostItems] {
        let allStoredPosts = await storedPosts()
        guard let storedPosts = allStoredPosts, !storedPosts.isEmpty else {
            throw LocalStorageRetrieverError.noObjectFound
        }
        return storedPosts
    }
    
    func requestRemotePosts() async throws -> [PostItems] {
        let endpoint = TopPostsEndpoint(path: Constants.URLs.topPostsURL(for: category))
        guard let urlRequest = endpoint.urlRequest() else { throw URLError(.badURL) }
        guard let posts: Posts = try await apiClient.get(request: urlRequest) else { throw APIError.noData }
        return posts.data.children.compactMap(\.data)
    }

    func persistPostItems(_ postItems: [PostItems]) {
        let categoryModel = CategoriesModel(
            category: self.category,
            postItems: postItems
        )
        
        modelContext?.insert(categoryModel)
        try? modelContext?.save()
    }

    func storedPosts() async -> [PostItems]? {
        return try? getLocallyStoredObject( CategoriesModel.self )
            .filter {
                $0.category == self.category
            }
            .map(\.postItems)
            .first
    }
}
