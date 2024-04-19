//
//  PostsResponseData.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit
struct Post: Codable {
    let title: String
    let time: String
    let url: String
    let type: Int
    let photoUrl: String
    let photoAlt: String
    
     enum CodingKeys: String, CodingKey {
           case title = "Title"
           case time = "Time"
           case url = "Url"
           case type = "Type"
           case photoUrl = "PhotoUrl"
           case photoAlt = "PhotoAlt"
       }
}

struct PostsResponseData: Codable {
    var postsData: [Post]
    
     enum CodingKeys: String, CodingKey {
        case postsData = "List"
    }
}
