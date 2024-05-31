//
//  LocationResponse.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation

struct LocationResponse: Decodable {
    let results: [Location]
}

struct Location: Decodable, Displayable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
