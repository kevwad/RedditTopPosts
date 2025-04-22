//
//  Resource.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-21.
//

enum Resource<T> {
    case loading(items: T? = nil, message: String? = nil)
    case loaded(items: T)
    case failed(error: Error)
    case idle
}
