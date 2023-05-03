//
//  Category.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 03/05/23.
//

import Foundation

struct Category: Decodable {
    let alias: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case alias
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.alias = try container.decodeIfPresent(String.self, forKey: .alias) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    }
}
