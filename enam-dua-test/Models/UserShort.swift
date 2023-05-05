//
//  UserShort.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 05/05/23.
//

import Foundation

struct UserShort: Decodable {
    let id: String
    let profileUrl: String
    let imageUrl: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileUrl = "profile_url"
        case imageUrl = "image_url"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.id         = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.profileUrl = try container.decodeIfPresent(String.self, forKey: .profileUrl) ?? ""
        self.imageUrl   = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        self.name       = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
    
    init(id: String, profileUrl: String, imageUrl: String, name: String) {
        self.id = id
        self.profileUrl = profileUrl
        self.imageUrl = imageUrl
        self.name = name
    }
}
