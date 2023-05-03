//
//  Business.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 03/05/23.
//

import Foundation

struct BusinessShort: Decodable {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [Category]
    let rating: Double
    let transactions: [String]
    let price: String
    let photos: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories
        case rating
        case transactions
        case price
        case photos
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.alias      = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        self.name       = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.imageUrl   = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        self.isClosed   = try container.decodeIfPresent(Bool.self, forKey: .isClosed) ?? false
        self.url        = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.reviewCount = try container.decodeIfPresent(Int.self, forKey: .reviewCount) ?? 0
        self.categories = try container.decodeIfPresent([Category].self, forKey: .categories) ?? []
        self.rating     = try container.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
        self.transactions = try container.decodeIfPresent([String].self, forKey: .transactions) ?? []
        self.price      = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        self.photos     = try container.decodeIfPresent([String].self, forKey: .photos) ?? []
    }
}
