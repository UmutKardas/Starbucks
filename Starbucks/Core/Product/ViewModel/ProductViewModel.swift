//
//  ProductViewModel.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 12.11.2024.
//

import Foundation

final class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var count: Int = 1
    @Published var selectedSize: CoffeeSize = .Tall

    var database: LocalDatabaseProtocol

    init(database: LocalDatabaseProtocol = AppContainer.shared.database) {
        self.database = database
    }

    func addOrder() {
        guard let product = product else { return }

        product.count = count
        product.size = selectedSize

        database.add(model: product)
    }
}
