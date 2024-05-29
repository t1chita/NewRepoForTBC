//
//  CountryModelForMainView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation


struct GalleryResponse: Decodable {
    var gallery: Gallery
}

struct Gallery: Decodable {
    var total: Int
    var slides: [Slide]
}

struct Slide: Decodable, Identifiable, Hashable {
    
    var slideId: Int
    var image: SlideImage
    var title: String
    var description: String
    
    var id: Int { slideId }
}

struct SlideImage: Decodable, Hashable {
    var alt: String
    var title: String
    var src: URL
}
