//
//  ReviewsResponse.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 05/05/23.
//

import Foundation

struct ReviewsResponse: Decodable {
    let reviews: [Reviews]
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case reviews
        case total
    }
    
    init(from decoder: Decoder) throws {
        let container   = try decoder.container(keyedBy: CodingKeys.self)
        self.reviews    = try container.decodeIfPresent([Reviews].self, forKey: .reviews) ?? []
        self.total      = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
    }
}
