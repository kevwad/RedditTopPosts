//
//  RedditTopPostsApp.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import SwiftUI

@main
struct RedditTopPostsApp: App {
    let diContainer: DIContainer!

    init() {
        self.diContainer = DependencyInjectionContainer()
    }

    var body: some Scene {
        WindowGroup {
            CategoryView(viewModel: .init(diContainer: diContainer))
        }
        .modelContainer(diContainer.sharedModelContainer)
    }
}
