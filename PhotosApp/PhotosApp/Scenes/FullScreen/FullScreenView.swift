//
//  FullScreenView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class FullScreenView: UIView {
    //MARK: - UIComponents
    let imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    var personsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .ramishvili
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
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
        setImageScrollView()
    }
    
    func setImageScrollView() {
        addSubview(imageScrollView)
        setContainerView()
        setConstraintsToImageScrollView()
    }
    
    func setContainerView() {
        imageScrollView.addSubview(containerView)
        setConsTraintsToContainerView()
        setPersonsImageView()
    }
    
    func setPersonsImageView() {
        containerView.addSubview(personsImageView)
        setConstraintsToPersonsImageView()
        
    }
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToImageScrollView() {
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: topAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }   
    func setConsTraintsToContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: imageScrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: imageScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: imageScrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: imageScrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: imageScrollView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: imageScrollView.heightAnchor),
        ])
    }
    
    func setConstraintsToPersonsImageView() {
        NSLayoutConstraint.activate([
            personsImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            personsImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            personsImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            personsImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
}

