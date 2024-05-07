//
//  MainPageView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class MainPageView: UIView {
    //MARK: - UIComponents
    let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "გალერია"
        label.textColor = .headerLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        return label
    }()
    
    let galleryCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 327, height: 700), collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.backgroundColor = .clear
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
        setHeaderTitle()
        setGalleruCollectionView()
    }
    
    func setHeaderTitle() {
        addSubview(headerTitle)
        setConstraintsToHeaderTitle()
    }
    
    func setGalleruCollectionView() {
        addSubview(galleryCollectionView)
        setConstraintsToGalleryCollectionView()
    }
    
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToHeaderTitle() {
        NSLayoutConstraint.activate([
            headerTitle.heightAnchor.constraint(equalToConstant: 41),
            headerTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 49),
        ])
    }
    
    func setConstraintsToGalleryCollectionView() {
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 10),
            galleryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            galleryCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
