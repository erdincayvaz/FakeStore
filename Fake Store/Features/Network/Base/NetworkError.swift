//
//  NetworkError.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

