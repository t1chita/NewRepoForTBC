//
//  CustomButton.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.textAlignment                 = .center
        layer.cornerRadius                        = 25
        backgroundColor                           = .startButtonBackground
        clipsToBounds                             = true
        titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 14)
        setTitleColor(.white, for: .normal)
    }
}
