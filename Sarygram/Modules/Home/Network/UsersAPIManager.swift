//
//  UsersAPIManager.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import Alamofire

class UsersAPIManager: NSObject {
    
    class func loadHomeUsers(success: @escaping (_: UsersResponse) -> Void, failure: @escaping (_: String) -> Void) {
        
        Alamofire.request(UsersRouter.homeUsers()).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                do {
                    let decoder = JSONDecoder()
                    let usersResponse = try decoder.decode(UsersResponse.self, from: response.data!)
                    print(usersResponse)
                    success(usersResponse)
                    
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
