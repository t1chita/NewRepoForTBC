//
//  CustomTextField.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addPaddingToTextField()
        layer.cornerRadius    = 9
        layer.borderWidth     = 1
        layer.borderColor     = UIColor.textFieldBorder.cgColor
        clipsToBounds         = true
        textColor             = .white
        frame                 = CGRect(x: 0, y: 0, width: 310, height: 45)
    }
}
