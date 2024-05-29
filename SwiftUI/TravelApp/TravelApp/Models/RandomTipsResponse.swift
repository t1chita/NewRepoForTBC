//
//  RandomTipsResponse.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation


struct RandomTipsResponse: Decodable {
    var tips: [Tips]
}

struct Tips: Decodable {
    var id: Int
    var travelTip: String
}
