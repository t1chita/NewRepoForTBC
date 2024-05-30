//
//  HotelsModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct HotelData: Decodable {
    let hotels: [HotelCategory]
}

struct HotelCategory: Decodable {
    let id: Int
    let hotels: [String]
}
