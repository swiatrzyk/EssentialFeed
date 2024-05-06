//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Sebastian Wiatrzyk on 06/05/2024.
//

import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]

        var feed: [FeedItem] {
            return items.map { $0.item }
        }
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let imageURL: URL

        var item: FeedItem {
            FeedItem(id: id, description: description, location: location, imageURL: imageURL)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case description
            case location
            case imageURL = "image"
        }
    }

    private static var OK_200: Int { return 200 }

    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(.invalidData)
        }

        return .success(root.feed)
    }
}
