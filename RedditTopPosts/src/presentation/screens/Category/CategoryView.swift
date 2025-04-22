//
//  CategoryView.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import SwiftUI

struct CategoryView: View {
 
    let viewModel: CategoryViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.categories, id: \.0) { category in
                NavigationLink(destination: {
                    let postVM = self.viewModel.viewModelForCategory(category.1)
                    PostsView(
                        viewModel: postVM
                    )
                    .task {
                        postVM.fetchPostItems()
                    }
                }, label: {
                    Text(category.0)
                })
            }
        }
    }
}
