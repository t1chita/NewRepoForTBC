//
//  FullScreenView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class FullScreenView: UIView {
    //MARK: - UIComponents
    
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
    }
    
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToImagesCollectionView() {
        NSLayoutConstraint.activate([
        ])
    }
}
