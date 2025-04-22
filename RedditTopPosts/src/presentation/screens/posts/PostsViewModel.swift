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
                
                /// ensure that the received category is a valid
                assert(Categories(rawValue: self.category) != nil)
                
                let categoryModel = CategoriesModel(category: self.category, postItems: posts)
                modelContext.insert(categoryModel)
                try modelContext.save()
            } catch {
                print(error.localizedDescription)
                self.postItems = .failed(error: error)
            }
        }
    }
}
