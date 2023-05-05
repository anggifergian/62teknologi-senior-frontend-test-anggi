//
//  YelpResponse.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 03/05/23.
//

import Foundation

struct BusinessResponse: Decodable {
    let businesses: [BusinessShort]
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case businesses
        case total
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businesses = try container.decodeIfPresent([BusinessShort].self, forKey: .businesses) ?? []
        self.total      = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
    }
}
