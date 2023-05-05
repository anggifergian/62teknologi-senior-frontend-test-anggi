//
//  Reviews.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 05/05/23.
//

import Foundation

struct Reviews: Decodable {
    let id: String
    let url: String
    let text: String
    let rating: Int
    let timeCreated: String
    let user: UserShort
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case text
        case rating
        case timeCreated = "time_created"
        case user
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.url        = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.text       = try container.decodeIfPresent(String.self, forKey: .text) ?? ""
        self.rating     = try container.decodeIfPresent(Int.self, forKey: .rating) ?? 0
        self.timeCreated = try container.decodeIfPresent(String.self, forKey: .timeCreated) ?? ""
        self.user       = try container.decodeIfPresent(UserShort.self, forKey: .user) ?? UserShort(id: "", profileUrl: "", imageUrl: "", name: "")
    }
}
