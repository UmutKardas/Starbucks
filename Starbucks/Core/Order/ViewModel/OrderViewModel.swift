//
//  OrderViewModel.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 13.11.2024.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var orders: [Product] = []
    @Published var isPaymentViewPresented: Bool = false

    private var database: LocalDatabaseProtocol

    init(database: LocalDatabaseProtocol = AppContainer.shared.database) {
        self.database = database
        fetchOrders()
    }

    private func fetchOrders() {
        orders = database.items()
    }

    func attemptPayment() {
        DispatchQueue.main.async {
            self.database.clearAll(model: Product.self)
        }

        orders = []

        // TODO: Add wallet balance check here before clearing database
        isPaymentViewPresented = true
    }

    func totalPrice() -> Double {
        orders.reduce(0) { $0 + $1.price * Double($1.count) }
    }
}
