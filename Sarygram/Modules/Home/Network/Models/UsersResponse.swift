//
//  UsersResponse.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import Foundation

struct UsersResponse : Codable {
    
    let users : [User]?
    
    enum CodingKeys: String, CodingKey {
        case users = "users"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        users = try values.decodeIfPresent([User].self, forKey: .users)
    }
    
}
