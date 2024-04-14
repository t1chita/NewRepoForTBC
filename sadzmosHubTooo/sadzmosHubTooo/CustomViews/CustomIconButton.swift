//
//  CustomIconButton.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class CustomIconButton: UIButton {
    init(image: UIImage) {
        super.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        setup(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage) {
        setImage(image, for: .normal)
        frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    }
}
