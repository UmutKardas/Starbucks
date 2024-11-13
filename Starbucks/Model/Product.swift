//
//  Product.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import Foundation
import RealmSwift

class Product: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var price: Double = 0.0
    @Persisted var about: String = ""
    @Persisted var image: String = ""
    @Persisted var category: Category = .Coffee
    @Persisted var size: CoffeeSize = .Grande
    @Persisted var count: Int = 1

    convenience init(name: String, price: Double, about: String, image: String, category: Category) {
        self.init()
        self.name = name
        self.price = price
        self.image = image
        self.about = about
        self.category = category
        self.size = .Grande
        self.count = 1
    }
}
