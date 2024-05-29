//
//  TransportsModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct TransportsResponse: Decodable, Identifiable, Hashable  {
    var id = UUID()
    var transport: [Transport]
}

struct Transport: Decodable, Hashable  {
    var transport: String
}
