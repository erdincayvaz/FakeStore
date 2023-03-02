//
//  Endpoint.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Foundation
import Alamofire

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var param: [String: String]? { get }
    var header: HTTPHeaders { get }
    var body: [String: String]? { get }
    var destination:URLEncoding.Destination? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "fakestoreapi.com"
    }
}

