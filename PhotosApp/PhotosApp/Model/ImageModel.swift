//
//  ImageModel.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

struct ImageModel: Decodable, Hashable {
    let urls: Urls
}

struct Urls: Decodable, Hashable {
    let regular: String
}
