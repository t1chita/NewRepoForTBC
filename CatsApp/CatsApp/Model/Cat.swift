//
//  Cat.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 01.05.24.
//

import UIKit



struct Cat: Decodable {
    var data: [CatData]
}

struct CatData: Decodable {
    var fact: String?
    var length: Int?
}
