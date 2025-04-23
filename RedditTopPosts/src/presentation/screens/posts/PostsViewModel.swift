//
//  PostsViewModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Observation
import SwiftData

@Observable
@MainActor class PostsViewModel {

    var postItems: Resource<[PostItems]> = Resource.idle
    let diContainer: DIContainer
    let postItemsRepo: PostItemsRepository
    let category: String
    var modelContext: ModelContext
    
    
    init(container: DIContainer, category: String) {
        diContainer = container
        modelContext = container.sharedModelContainer.mainContext
        self.category = category
        postItemsRepo = .init(
            apiClient: container.apiClient,
            modelContext: container.sharedModelContainer.mainContext,
            category: category)
    }
    
    func fetchPostItems() {
        postItems = Resource.loading(message: "Loading top posts...")
        Task {
            do {
                let posts = try await postItemsRepo.getPosts()
                self.postItems = .loaded(items: posts)
            } catch {
                print(error.localizedDescription)
                self.postItems = .failed(error: error)
            }
        }
    }
}
