    //
    //  FeedLoader.swift
    //  EssentialFeed
    //
    //  Created by Sebastian Wiatrzyk on 29/03/2024.
    //

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
