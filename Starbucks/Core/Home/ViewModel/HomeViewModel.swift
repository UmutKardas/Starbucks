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
            Product(name: "Fantasy Tail", price: 6.99, about: "A magical blend of flavors to brighten your day.", image: "fantasyTail", category: .Frappuccino),
            Product(name: "Rainbow Drink", price: 7.99, about: "A vibrant, refreshing drink that tastes as good as it looks.", image: "rainbow", category: .Frappuccino),
            Product(name: "Red Velvet", price: 5.99, about: "Smooth and creamy with a hint of rich red velvet flavor.", image: "velvet", category: .Frappuccino),
            Product(name: "Grape", price: 6.99, about: "Sweet and fruity grape frappuccino, perfect for a summer treat.", image: "grape", category: .Frappuccino),
            Product(name: "Caramel Mocha", price: 6.99, about: "Indulgent caramel and rich mocha, blended for a delightful experience.", image: "caramelMocha", category: .Frappuccino),
            Product(name: "Matcha White Chocolate", price: 6.99, about: "A harmonious mix of earthy matcha and creamy white chocolate.", image: "matchaWhiteChocolate", category: .Frappuccino),
            Product(name: "Turkey Bacon 1", price: 5.99, about: "Savory turkey bacon served with your breakfast favorites.", image: "turkeyBacon", category: .Breakfast),
            Product(name: "Breakfast 1", price: 7.99, about: "A complete breakfast with all the classics you love.", image: "breakfast", category: .Breakfast),
            Product(name: "Breakfast Wrap", price: 9.99, about: "A warm wrap filled with hearty breakfast ingredients.", image: "breakfastWrap", category: .Breakfast),
            Product(name: "Sandwich", price: 4.99, about: "A satisfying breakfast sandwich to start your morning right.", image: "sandwich", category: .Breakfast),
            Product(name: "Turkey Bacon 2", price: 6.99, about: "Delicious turkey bacon served with a side of freshness.", image: "turkeyBacon", category: .Breakfast),
            Product(name: "Breakfast 2", price: 7.99, about: "An energizing breakfast meal to keep you going all day.", image: "breakfast", category: .Breakfast)
        ]

        selectedCategory = .Frappuccino
    }
}
