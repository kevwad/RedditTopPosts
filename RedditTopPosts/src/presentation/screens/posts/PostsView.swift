//
//  PostsView.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

import SwiftUI
import SwiftData

struct PostsView: View {
    let viewModel: PostsViewModel
    
    var body: some View {
        
        Group {
            
            switch viewModel.postItems {
            case let .loaded(items):
                List(items) { item in
                    PostRow(post: item)
                }
                
            case let .loading(_, message):
                ProgressView {
                    Text(message ?? "Loading...")
                }
                
            case .failed(let error):
                Text("\(error.localizedDescription)")
                
            default:
                Text("Something went wrong!")
            }            
        }
        
    }
}

struct PostRow: View {
    var post: PostItems

    var body: some View {
        VStack {
            if post.thumbnail.hasPrefix(Constants.Protocols.http) {
                HStack {
                    AsyncImage(url: URL(string: post.thumbnail)) {
                        $0.aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView {
                            Text("Loading...")
                        }
                    }
                    Spacer()
                }
            }
            HStack {
                Text(post.title)
                Spacer()
            }
        }
    }
}
