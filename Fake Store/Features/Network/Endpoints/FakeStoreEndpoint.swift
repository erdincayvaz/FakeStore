//
//  FakeStoreEndpoint.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Alamofire
import Foundation

enum FakeStoreEndpoint {
    case login(request: LoginRequest)
    case products
}

extension FakeStoreEndpoint: Endpoint {
    var destination: Alamofire.URLEncoding.Destination? {
        switch self {
        case .login:
            return .httpBody
        case .products:
            return .queryString
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .products:
            return "/products"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .products:
            return .get
        }
    }
    
    var param: [String : String]? {
        switch self {
        case .login(let request):
            return ["username": request.username,
                    "password":request.password]
        case .products:
            return [:]
        }
    }

    var header: HTTPHeaders {
        switch self {
        case .login, .products:
            return []
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .login, .products:
            return nil
        }
    }
}
