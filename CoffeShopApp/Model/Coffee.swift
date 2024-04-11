//
//  Coffee.swift
//  UISecondLecture
//
//  Created by Temur Chitashvili on 05.04.24.
//

import Foundation

class Coffee {
    let productName: String?
    let specialIngredient: String?
    var description: String?
    var rating: Double?
    let dictionaryForSizeAndPrice: [String: Double] = ["პაწა": 3.50 , "საშუალო" : 4.5, "დიდი" : 5.5 ]
    
    
    init(productName: String?, specialIngredient: String?, description: String? = nil, rating: Double? = nil, dictionaryForSizeAndPrice: [String : Double] = ["პაწა": 3.50 , "საშუალო" : 4.5, "დიდი" : 5.5 ]) {
        self.productName = productName
        self.specialIngredient = specialIngredient
        self.description = description
        self.rating = rating
    }

}
