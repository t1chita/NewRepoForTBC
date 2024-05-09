//
//  FullScreenViewModel.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import Foundation

class FullScreenViewModel {
    //MARK: - Properties
    var imageIndex: Int = 0 {
        didSet {
        }
    }
    
    //MARK: - Child Methods
    func setImageIndex(_ value: Int) {
        imageIndex = value
    }
}
