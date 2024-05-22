//
//  TrackModel.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 16.05.24.
//

import Foundation

struct Artist: Decodable {
    var name: String?
}

struct Album: Decodable {
    var title: String?
    var coverBig: String?

    enum CodingKeys: String, CodingKey {
        case title
        case coverBig = "cover_big"
    }
}

struct Track: Decodable {
    var title: String?
    var duration: Int?
    var preview: String?
    var artist: Artist?
    var album: Album?
}

struct TracksResponse: Decodable {
    var data: [Track]
}
