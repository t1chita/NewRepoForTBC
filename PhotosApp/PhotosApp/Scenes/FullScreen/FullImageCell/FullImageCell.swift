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
    }
    
    //MARK: - Setup UI Components
    func setupUI() {
        clipsToBounds = true
    }
    //MARK: - Set Constrainst To UI Components
   
}
