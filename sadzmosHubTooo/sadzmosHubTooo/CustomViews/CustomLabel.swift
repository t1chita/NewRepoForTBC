//
//  CustomLabel.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class CustomLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
       textColor = .white
       font      = UIFont(name: "FiraGO-Medium", size: 14)
    }
}
