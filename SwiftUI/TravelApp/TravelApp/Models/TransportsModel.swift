//
//  TransportsModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct TransportsResponse: Decodable  {
    var transport: [Transport]
}

struct Transport: Decodable {
    let id: Int
    var transport: [String]
}
