//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Sebastian Wiatrzyk on 29/03/2024.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
