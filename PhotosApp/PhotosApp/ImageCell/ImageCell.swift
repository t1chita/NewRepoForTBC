//
//  ImageCell.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class ImageCell: UICollectionViewCell {
    //MARK: Identifier
    static let identifier = "ImageCell"
    
    //MARK: - UIComponents
    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .ramishvili
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI Components
    func setupUI() {
        setPersonImageView()
        clipsToBounds = true
    }
    
    func setPersonImageView() {
        addSubview(personImageView)
        setConstraintsToPersonImage()
    }
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToPersonImage() {
        NSLayoutConstraint.activate([
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            personImageView.topAnchor.constraint(equalTo: topAnchor),
            personImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
