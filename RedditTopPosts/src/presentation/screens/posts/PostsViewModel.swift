//
//  PostsViewModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import Observation
import SwiftData

@Observable
class PostsViewModel {

    var postItems: Resource<[PostItems]> = Resource.idle
    let diContainer: DIContainer
    let postItemsRepo: PostItemsRepository
    let category: String
    
    
    init(container: DIContainer, category: String) {
        diContainer = container
        self.category = category
        postItemsRepo = .init(
            apiClient: container.apiClient,
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
    
    func refresh() async {
        do {
            let remotePosts = try await postItemsRepo.requestRemotePosts()
            if !remotePosts.isEmpty {
                print("[PostsVM]: On refresh, received \(remotePosts.count) new posts.")
                self.postItems = .loaded(items: remotePosts)
            }
        } catch {
            // do nothing
        }
    }
}
