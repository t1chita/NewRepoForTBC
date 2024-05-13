//
//  UnitTestingAssignmentNetworkignTest.swift
//  UnitTestingAssignmentTests
//
//  Created by Temur Chitashvili on 13.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentNetworkignTest: XCTestCase {
    
    func testFetchMovies() {
        let expectation = self.expectation(description: "Fetching Products From API")
        let apiUrl = URL(string: "https://dummyjson.com/products")!
        
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            
            XCTAssertNil(error, "შეცდომა: \(error?.localizedDescription ?? "") ")
            XCTAssertNotNil(data, "არ გვაქვს დატა")
            
            do {
                let decoder = JSONDecoder()
                let productsResponse = try decoder.decode(Products.self, from: data!)
                
                XCTAssertFalse(productsResponse.products.isEmpty, "არ გვაქვს ფილმები")
                
                for product in productsResponse.products {
                    XCTAssertNotNil(product.id, "id არ არის nil")
                }
                
                expectation.fulfill()
            } catch {
                XCTFail("ვერ მოხდა დეკოდირება: \(error.localizedDescription)")
            }
        }.resume()
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
