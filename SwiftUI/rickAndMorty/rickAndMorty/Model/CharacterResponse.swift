//
//  CharacterResponse.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [CartoonCharacter]
}

struct CartoonCharacter: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: CharacterOrigin
    let episode: [String]
    let image: String
}

struct CharacterOrigin: Decodable {
    let name: String
    let url: String
}
