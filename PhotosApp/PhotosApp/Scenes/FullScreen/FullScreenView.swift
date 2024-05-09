//
//  FullScreenView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class FullScreenView: UIView {
    //MARK: - UIComponents
    let imagesCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FullImageCell.self, forCellWithReuseIdentifier: FullImageCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = false
        return collectionView
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI Components
    func setup() {
        setImagesCollectionView()
    }
    
    func setImagesCollectionView() {
        addSubview(imagesCollectionView)
        setConstraintsToImagesCollectionView()
    }
    
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToImagesCollectionView() {
        NSLayoutConstraint.activate([
            imagesCollectionView.topAnchor.constraint(equalTo: topAnchor,constant: 50),
            imagesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imagesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
