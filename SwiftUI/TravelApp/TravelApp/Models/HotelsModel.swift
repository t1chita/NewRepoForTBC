//
//  HotelsModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct HotelsResponse: Decodable, Identifiable, Hashable {
    var id = UUID()
    var hotels: [Hotel]
}

struct Hotel: Decodable, Hashable  {
    var hotel: String
}
