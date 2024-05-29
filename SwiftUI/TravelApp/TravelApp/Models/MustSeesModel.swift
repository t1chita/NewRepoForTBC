//
//  MustSeesModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

struct MustSeesResponse: Decodable, Identifiable, Hashable  {
    var id = UUID()
    var mustSee: [MustSee]
}

struct MustSee: Decodable, Hashable  {
    var mustSee: String
}
