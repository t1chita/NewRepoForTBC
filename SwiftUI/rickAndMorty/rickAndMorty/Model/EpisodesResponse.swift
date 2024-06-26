//
//  EpisodesResponse.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation

struct EpisodesResponse: Decodable {
    let results: [Episode]
}

struct Episode: Decodable, Displayable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
    }
}
