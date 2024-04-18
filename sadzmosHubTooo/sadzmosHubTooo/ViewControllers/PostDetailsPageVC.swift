//
//  PostDetailsPageVC.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class PostDetailsPageVC: UIViewController {
    //MARK: UI Components-
    var background       = CustomBackgroundImage(image: .background)
    var iconImage        = UIImageView()
    var headerLabel      = CustomLabel()
    var descriptionLabel = CustomLabel()
    let goBackButton     = CustomButton()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: setupUI-
    func setupUI() {
        setBackground()
        setIconImage()
        setHeaderLabel()
        setDescriptionLabel()
        setGoBackButton()
    }
    
    //MARK: configuration Of Ui Components-
    func setBackground() {
        view.addSubview(background)
        setConstraintsToBackground()
    }
   
    func setHeaderLabel() {
        view.addSubview(headerLabel)
        setConstraintsToHeaderLabel()
        headerLabel.font          = UIFont(name: "FiraGO-Medium", size: 30)
        headerLabel.textAlignment = .left
        headerLabel.numberOfLines = 0
    }
    
    func setDescriptionLabel() {
        view.addSubview(descriptionLabel)
        setConstraintsToDescriptionLabel()
        descriptionLabel.font          = UIFont(name: "FiraGO-Medium", size: 16)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
    }
    
    func setGoBackButton() {
        view.addSubview(goBackButton)
        setConstraintsToGoBackButton()
        goBackButton.setTitle("დაბრუნდი უკან", for: .normal)
        goBackButton.addAction(UIAction(title: "Go Back To Main Page", handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    func setIconImage() {
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToIconImage()
    }
    
    //MARK: setConstraints-
    func setConstraintsToBackground() {
        NSLayoutConstraint.activate([
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    func setConstraintsToHeaderLabel() {
        NSLayoutConstraint.activate([
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        ])
    }
    
    func setConstraintsToDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
        ])
    }
    
    func setConstraintsToGoBackButton() {
        NSLayoutConstraint.activate([
            goBackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goBackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            goBackButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func setConstraintsToIconImage() {
        NSLayoutConstraint.activate([
            iconImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            iconImage.heightAnchor.constraint(equalToConstant: 40),
            iconImage.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}

