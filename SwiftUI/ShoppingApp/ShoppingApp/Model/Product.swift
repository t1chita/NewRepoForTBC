//
//  Product.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI


struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let image: ImageResource
    var counter: Int
    var totalPrice: Int
    var isProductOutOfStock: Bool
}


