//
//  FullImageCell.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 09.05.24.
//

import UIKit

class FullImageCell: UICollectionViewCell {
    //MARK: Identifier
    static let identifier = "FullImageCell"
    
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
        guard let url = URL(string: imageUrl) else { return }
        imageView.loadImage(from: url)
    }
    
    //MARK: - Setup UI Components
    func setupUI() {
        setImageView()
        clipsToBounds = true
    }
    
    func setImageView() {
        addSubview(imageView)
        setConstraintsToImageView()
    }
    
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToImageView() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
