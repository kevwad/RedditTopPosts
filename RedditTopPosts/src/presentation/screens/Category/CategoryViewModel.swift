//
//  CategoryViewModel.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//


class CategoryViewModel {
    var postVMs: [String: PostsViewModel] = [:]    
    let diContainer: DIContainer
    let categories: [(String, String)] = Categories.allCases
        .map(\.rawValue)
        .map { category in
            (String(localized: "\(category)"), category)
        }
    
    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }
    
    func viewModelForCategory(_ category: String) -> PostsViewModel {
        if let existingVM = postVMs[category] {
            return existingVM
        } else {
            let newVM = PostsViewModel(container: diContainer, category: category)
            postVMs[category] = newVM
            return newVM
        }
    }
}
