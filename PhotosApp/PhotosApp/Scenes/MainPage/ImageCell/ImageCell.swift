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
    let imageView: UIImageView = {
        let imageView = UIImageView()
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
    
    //MARK: Configure
    func configure(imageUrl: String) {
        self.imageView.loadImage(from: URL(string: imageUrl)!)
    }
    
    //MARK: - Setup UI Components
    func setupUI() {
        setPersonImageView()
        clipsToBounds = true
    }
    
    func setPersonImageView() {
        addSubview(imageView)
        setConstraintsToPersonImage()
    }
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToPersonImage() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
