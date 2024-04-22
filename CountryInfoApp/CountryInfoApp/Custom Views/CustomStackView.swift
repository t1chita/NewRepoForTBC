//
//  CustomLabel.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 22.04.24.
//

import UIKit

class CustomStackView: UIStackView {
    let generalLabel = UILabel()
    let countryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setNameStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNameStackView() {
        self.addArrangedSubview(generalLabel)
        self.addArrangedSubview(countryLabel)
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally
        setGeneralLabel()
        setCountryLabel()
    }
    
    func setGeneralLabel() {
        generalLabel.text = "Country Name:"
        generalLabel.translatesAutoresizingMaskIntoConstraints = false
        generalLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        generalLabel.textColor = .black
        generalLabel.textAlignment = .left
    }
    
    func setCountryLabel() {
        countryLabel.text = "საქართველო"
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        countryLabel.textColor = .black
        countryLabel.textAlignment = .right
        countryLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        countryLabel.numberOfLines = 0
    }
}
