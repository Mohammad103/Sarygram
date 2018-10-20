//
//  PostsAPIManager.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import Alamofire

class PostsAPIManager: NSObject {
    
    class func loadHomePosts(success: @escaping (_: PostsResponse) -> Void, failure: @escaping (_: String) -> Void) {
        
        Alamofire.request(PostsRouter.homePosts()).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                do {
                    let decoder = JSONDecoder()
                    let postsResponse = try decoder.decode(PostsResponse.self, from: response.data!)
                    print(postsResponse)
                    success(postsResponse)
                    
                } catch let error {
                    let errorMessage = "Parsing failed with error: \(error)"
                    print(errorMessage)
                    failure(errorMessage)
                }
                
            case .failure(let error):
                let errorMessage = "Request failed with error: \(error)"
                print(errorMessage)
                failure(errorMessage)
            }
        }
    }
    
}
