//
//  PostsResponse.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import Foundation

struct PostsResponse : Codable {
    
    let posts : [Post]?
    
    enum CodingKeys: String, CodingKey {
        case posts = "posts"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        posts = try values.decodeIfPresent([Post].self, forKey: .posts)
    }
    
}
