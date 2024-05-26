//
//  Product.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import Foundation


struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

struct ProductList {
    static let products = [
        Product(name: "Apple", price: 1),
        Product(name: "Banana", price: 1),
        Product(name: "Orange", price: 2),
        Product(name: "Mango", price: 3),
        Product(name: "Grapes", price: 2),
        Product(name: "Pineapple", price: 3),
        Product(name: "Strawberry", price: 4),
        Product(name: "Blueberry", price: 5),
        Product(name: "Kiwi", price: 2),
        Product(name: "Watermelon", price: 4),
        Product(name: "Papaya", price: 3),
        Product(name: "Peach", price: 2)
    ]
}
