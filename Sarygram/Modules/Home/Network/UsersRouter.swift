//
//  UsersRouter.swift
//  Sarygram
//
//  Created by Mohammad Shaker on 10/20/18.
//  Copyright © 2018 Mohammad Shaker. All rights reserved.
//

import UIKit
import Alamofire

enum UsersRouter: URLRequestConvertible {
    case homeUsers()
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .homeUsers:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .homeUsers():
            return "users.php"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .homeUsers:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url = K.ProductionServer.baseURL + path
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
