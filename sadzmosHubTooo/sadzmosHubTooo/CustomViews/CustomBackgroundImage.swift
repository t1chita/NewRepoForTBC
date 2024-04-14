//
//  CustomBackgroundImage.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class CustomBackgroundImage: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode                               = .scaleAspectFill
    }
}
