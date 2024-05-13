//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Temur Chitashvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
    }
    
    func testItemsQuantity() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        let productSecond = Product(id: 2, price: 50, selectedQuantity: 1)
        
        cartViewModel.selectedProducts.append(productFirst)
        cartViewModel.selectedProducts.append(productSecond)
        
        XCTAssertEqual(cartViewModel.selectedItemsQuantity,4)
    }
       
    func testTotalPrice() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        let productSecond = Product(id: 2, price: 50, selectedQuantity: 1)
        
        cartViewModel.selectedProducts.append(productFirst)
        cartViewModel.selectedProducts.append(productSecond)
        
        XCTAssertEqual(cartViewModel.totalPrice, 140)
    }
    
    func testAddProductWithID() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        cartViewModel.allproducts = [productFirst]
        
        cartViewModel.addProduct(withID: productFirst.id)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testAddProduct() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        
        cartViewModel.addProduct(product: productFirst)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testAddRandomProduct() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        let productSecond = Product(id: 2, price: 50, selectedQuantity: 1)
        cartViewModel.allproducts = [productFirst, productSecond]
        
        cartViewModel.addRandomProduct()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
    
    func testRemoveProductWithID() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        let productSecond = Product(id: 2, price: 50, selectedQuantity: 1)
        let productThird = Product(id: 3, price: 50, selectedQuantity: 1)
        cartViewModel.selectedProducts = [productFirst, productSecond, productThird]
        
        cartViewModel.removeProduct(withID: productFirst.id ?? 0)
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 2)
    }
    
    func testClearCart() {
        let productFirst = Product(id: 1, price: 30, selectedQuantity: 3)
        let productSecond = Product(id: 2, price: 50, selectedQuantity: 1)
        let productThird = Product(id: 3, price: 50, selectedQuantity: 1)
        cartViewModel.selectedProducts = [productFirst, productSecond, productThird]
        
        cartViewModel.clearCart()
        
        XCTAssertEqual(cartViewModel.selectedProducts.count, 0)
    }
}
