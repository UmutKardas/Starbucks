//
//  Product.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var image: String
    var category: Category
}
