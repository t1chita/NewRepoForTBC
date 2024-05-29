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
    @Published var productsTotalPrice: Float = 0
    @Published var saleButtonTapped: Bool = false
    
    //MARK: Initialisation
    init() {
        loadProducts()
    }
    
    private func loadProducts() {
        products = productsData
    }
    
    // MARK: Methods
    func increaseProductCounter(id: UUID) {
        guard let index = products.firstIndex(where: { $0.id == id }) else { return }
        let product = products[index]
        
        products[index].counter += 1
        updateTotalPriceAndQuantity(for: product.price, increase: true)
        updateProductTotalPrice(at: index, increase: true)
    }
    
    func decreaseProductCounter(id: UUID) {
        guard let index = products.firstIndex(where: { $0.id == id }), products[index].counter > 0 else { return }
        let product = products[index]
        
        products[index].counter -= 1
        updateTotalPriceAndQuantity(for: product.price, increase: false)
        updateProductTotalPrice(at: index, increase: false)
    }
    
    func removeProductFromCart(id: UUID) {
        guard let index = products.firstIndex(where: { $0.id == id }) else { return }
        let product = products[index]
        
        productsTotalPrice -= product.totalPrice
        productsQuantity -= product.counter
        products[index].counter = 0
        products[index].totalPrice = 0
    }
    
    func applyTwentyPercentDiscount() {
        for index in products.indices {
            let discountedPrice = products[index].price * 0.8
            let discountAmount = (products[index].price - discountedPrice) * Float(products[index].counter)
            
            products[index].price = discountedPrice
            products[index].totalPrice -= discountAmount
            productsTotalPrice -= discountAmount
        }
        saleButtonTapped = true
    }
    
    // MARK: Child Methods
    private func updateTotalPriceAndQuantity(for price: Float, increase: Bool) {
        productsTotalPrice += increase ? price : -price
        productsQuantity += increase ? 1 : -1
    }
    
    private func updateProductTotalPrice(at index: Int, increase: Bool) {
        products[index].totalPrice += increase ? products[index].price : -products[index].price
    }
}


let productsData = [
    Product(name: "Apple", price: 1, image: .apple, counter: 0, totalPrice: 0),
    Product(name: "Banana", price: 1, image: .banana, counter: 0, totalPrice: 0),
    Product(name: "Orange", price: 2, image: .orange, counter: 0, totalPrice: 0),
    Product(name: "Mango", price: 3, image: .mango, counter: 0, totalPrice: 0),
    Product(name: "Grapes", price: 2, image: .grape, counter: 0, totalPrice: 0),
    Product(name: "Strawberry", price: 4, image: .strawberry, counter: 0, totalPrice: 0),
    Product(name: "Kiwi", price: 2, image: .kiwi, counter: 0, totalPrice: 0),
    Product(name: "Chickoo", price: 2, image: .chickoo, counter: 0, totalPrice: 0),
]

