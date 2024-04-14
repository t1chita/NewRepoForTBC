//
//  PostsCell.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class PostsCell: UICollectionViewCell {
    static let identifier = "PostsCell"
    
    //MARK: UI Components-
    var iconImage         = UIImageView()
    let stackViewOfLabels = UIStackView()
    var headerLabel       = UILabel()
    var descriptionLAbel  = UILabel()
    
    func configuration(image: UIImageView, headerText: String, descriptionText: String ) {
        iconImage.image        = image.image
        headerLabel.text       = headerText
        descriptionLAbel.text  = descriptionText
        setupUI()
    }
    
    func setupUI() {
        addSubview(iconImage)
        addSubview(stackViewOfLabels)
        setStackViewOfLabels()
        setIconImage()
        backgroundColor    = .cellBackground
        clipsToBounds      = true
        layer.opacity      = 0.5
        layer.cornerRadius = 15
    }
    
    //MARK: configuration Of UI Components-
    func setStackViewOfLabels() {
        setConstraintsToStackViewOfLabels()
        stackViewOfLabels.addArrangedSubview(headerLabel)
        stackViewOfLabels.addArrangedSubview(descriptionLAbel)
        setHeaderLabel()
        setDescriptionLabel()
        stackViewOfLabels.translatesAutoresizingMaskIntoConstraints = false
        stackViewOfLabels.axis                                      = .vertical
        stackViewOfLabels.alignment                                 = .fill
        stackViewOfLabels.distribution                              = .fillProportionally
    }
    
    func setIconImage() {
        setConstraintsToIconImage()
        iconImage.contentMode                               = .scaleAspectFill
        iconImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setHeaderLabel() {
        headerLabel.font          = UIFont(name: "FiraGO-Medium", size: 16)
        headerLabel.textColor     = .white
        headerLabel.numberOfLines = 0
        headerLabel.widthAnchor.constraint(equalTo: stackViewOfLabels.widthAnchor).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 72).isActive = true
    }
    
    func setDescriptionLabel() {
        descriptionLAbel.font          = UIFont(name: "FiraGO-Medium", size: 10)
        descriptionLAbel.textColor     = .descriptionTextcolor
        descriptionLAbel.numberOfLines = 0
        descriptionLAbel.widthAnchor.constraint(equalTo: stackViewOfLabels.widthAnchor).isActive = true
        descriptionLAbel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //MARK: setConstraints-
    func setConstraintsToStackViewOfLabels() {
        NSLayoutConstraint.activate([
            stackViewOfLabels.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackViewOfLabels.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 12),
            stackViewOfLabels.widthAnchor.constraint(equalToConstant: 124),
            stackViewOfLabels.heightAnchor.constraint(equalToConstant: 102),
            stackViewOfLabels.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42)
        ])
    }
    
    func setConstraintsToIconImage() {
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            iconImage.heightAnchor.constraint(equalToConstant: 40),
            iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -96)
        ])
    }
}
