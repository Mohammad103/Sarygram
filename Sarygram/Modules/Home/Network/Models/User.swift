//
//  User.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import Foundation

struct User : Codable {
    
    let userName : String?
    let profileImage : String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case profileImage = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
    }
    
}
