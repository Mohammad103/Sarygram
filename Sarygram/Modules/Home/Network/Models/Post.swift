//
//  Post.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import Foundation

struct Post : Codable {
    
    let userName : String?
    let country: String?
    let profileImage: String?
    let postImage: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case country = "country"
        case profileImage = "profile_image"
        case postImage = "post_image"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        postImage = try values.decodeIfPresent(String.self, forKey: .postImage)
        date = try values.decodeIfPresent(String.self, forKey: .date)
    }
    
}
