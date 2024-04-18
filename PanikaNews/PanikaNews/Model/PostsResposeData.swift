//
//  PostsResposeData.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit
struct Post {
    let title: String
    let time: String
    let url: String
    let type: Int
    let photoUrl: String
    let photoAlt: String
}
struct PostsResposeData {
    var postsData: [Post]
}
