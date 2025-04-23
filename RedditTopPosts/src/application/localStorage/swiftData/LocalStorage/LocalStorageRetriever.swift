//
//  LocalStorageRetriever.swift
//  RedditTopPosts
//
//  Created by Kevin Wadera on 2025-04-22.
//

import SwiftData
import Foundation

enum LocalStorageRetrieverError: Error {
    case noObjectFound
    case modelContextUnavailable
}

protocol LocalStorageAPI {
    var modelContext: ModelContext? { get }
    var modelContainer: ModelContainer? { get }
    
    func getLocallyStoredObject<T: PersistentModel>(
        _ type: T.Type,
        predicate: Predicate<T>?,
        sortBy: [SortDescriptor<T>]) throws -> [T]
}

extension LocalStorageAPI {
    
    func getLocallyStoredObject<T: PersistentModel>(
        _ type: T.Type,
        predicate: Predicate<T>? = nil,
        sortBy: [SortDescriptor<T>] = []) throws -> [T] {
            let fetchDescriptor = FetchDescriptor<T>()
            guard let fetchedItems = try modelContext?.fetch(fetchDescriptor) else {
                throw LocalStorageRetrieverError.modelContextUnavailable
            }
            return fetchedItems
        }
}
