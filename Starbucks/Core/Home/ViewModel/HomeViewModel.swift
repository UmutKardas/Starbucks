//
//  HomeViewModel.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 4.11.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var isProductViewPresented = false
    @Published var searchText = ""
    @Published var selectedProducts: [Product] = []
    @Published var selectedCategory: Category = .Frappuccino {
        didSet {
            selectedProducts = products.filter { $0.category == selectedCategory }
        }
    }

    private var products: [Product] = []

    init() {
        products = [
            Product(name: "Fantasy Tail", price: 6.99, image: "fantasyTail", category: .Frappuccino),
            Product(name: "Rainbow Drink", price: 7.99, image: "rainbow", category: .Frappuccino),
            Product(name: "Red Velvet", price: 5.99, image: "velvet", category: .Frappuccino),
            Product(name: "Grape", price: 6.99, image: "grape", category: .Frappuccino),
            Product(name: "Caramel Mocha", price: 6.99, image: "caramelMocha", category: .Frappuccino),
            Product(name: "Matcha White Chocolate", price: 6.99, image: "matchaWhiteChocolate", category: .Frappuccino),
            Product(name: "Turkey Bacon 1", price: 15.99, image: "turkeyBacon", category: .Breakfast),
            Product(name: "Breakfast 1", price: 20.99, image: "breakfast", category: .Breakfast),
            Product(name: "Breakfast Wrap", price: 14.99, image: "breakfastWrap", category: .Breakfast),
            Product(name: "Sandwich", price: 14.99, image: "sandwich", category: .Breakfast),
            Product(name: "Turkey Bacon 2", price: 15.99, image: "turkeyBacon", category: .Breakfast),
            Product(name: "Breakfast 2", price: 20.99, image: "breakfast", category: .Breakfast),
        ]

        selectedCategory = .Frappuccino
    }
}
