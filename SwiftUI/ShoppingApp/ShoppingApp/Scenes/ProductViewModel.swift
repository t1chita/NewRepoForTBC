//
//  ProductViewModel.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 26.05.24.
//

import Foundation


class ProductViewModel: ObservableObject {
    //MARK: Properties
    @Published var products: [Product] = []
    @Published var productsQuantity: Int = 0
    @Published var productsTotalPrice: Int = 0
    @Published var isAmountEmpty: Bool = false
    
    //MARK: Initialisation
    init() {
        addProducts()
    }
    
    func addProducts() {
        products = productsData
    }
    
    //MARK: Methods
    func increaseSelectedProductCounter(id: UUID) {
        if let index = products.firstIndex(where: { $0.id == id}) {
            increaseTotalPriceAndQuantity(index: index)
            increaseSelectedProductsTotalPrice(index: index)
            products[index].counter += 1
        }
    }
    
    func decreaseSelectedProductCounter(id: UUID) {
        if let index = products.firstIndex(where: { $0.id == id}) {
            if products[index].counter > 0 {
                decreaseTotalPriceAndQuantity(index: index)
                decreaseSelectedProductsTotalPrice(index: index)
                products[index].counter -= 1
            }
        }
    }
    
    func deleteProductFromCart(id: UUID) {
        if let index = products.firstIndex(where: {$0.id == id}) {
            productsTotalPrice -= products[index].totalPrice
            productsQuantity -= products[index].counter
            products[index].totalPrice = 0
            products[index].counter = 0
        }
    }
    
    //MARK: Child Methods
    private func increaseSelectedProductsTotalPrice(index: Int) {
        products[index].totalPrice += products[index].price
    }
    
    private func increaseTotalPriceAndQuantity(index: Int) {
        productsTotalPrice += products[index].price
        productsQuantity += 1
    }
    
    private func decreaseSelectedProductsTotalPrice(index: Int) {
            products[index].totalPrice -= products[index].price
    }
    
    private func decreaseTotalPriceAndQuantity(index: Int) {
            productsTotalPrice -= products[index].price
            productsQuantity -= 1
    }
    
}

let productsData = [
    Product(name: "Apple", price: 1, image: .apple, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Banana", price: 1, image: .banana, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Orange", price: 2, image: .orange, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Mango", price: 3, image: .mango, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Grapes", price: 2, image: .grape, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Strawberry", price: 4, image: .strawberry, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Kiwi", price: 2, image: .kiwi, counter: 0, totalPrice: 0, isProductOutOfStock: false),
    Product(name: "Chickoo", price: 2, image: .chickoo, counter: 0, totalPrice: 0, isProductOutOfStock: false),
]
