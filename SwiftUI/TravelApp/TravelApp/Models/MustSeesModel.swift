//
//  MustSeesModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct MustSeesResponse: Decodable {
    var mustSee: [MustSee]
}

struct MustSee: Decodable {
    var id: Int
    var mustSee: [String]
}
