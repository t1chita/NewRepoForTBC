//
//  CustomLoginStackView.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 26.04.24.
//

import UIKit

class CustomLoginStackView: UIStackView {
    var headerLabel = UILabel()
    var textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLoginStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLoginStackView() {
        self.addArrangedSubview(headerLabel)
        self.addArrangedSubview(textField)
        self.axis = .vertical
        self.alignment = .fill
        self.spacing = 6
        self.distribution = .fillProportionally
        setHeaderLabel()
        setTextField()
    }
    
    func setHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        headerLabel.textColor = .systemLabel
        headerLabel.textAlignment = .left
        headerLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
    }
    
    func setTextField() {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .medium)
        ]
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addPaddingToTextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "", attributes: attributes)
        textField.textColor = .systemLabel
        textField.backgroundColor = .textFieldBackground
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 22.5
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    }
}


//MARK:  Extensions-
extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
