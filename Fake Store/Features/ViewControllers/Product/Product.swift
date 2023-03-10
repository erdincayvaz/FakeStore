//
//  Product.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description: String?
    var category: String?
    var image: String?
    var rating: Rating?
}

// MARK: - Rating
struct Rating: Codable {
    var rate: Double?
    var count: Int?
}
