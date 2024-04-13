//
//  DetailsPageVC.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 13.04.24.
//

import UIKit

class DetailsPageVC: UIViewController {
    //MARK: UI Components-
    let imageBackgroundView  = UIView()
    var personsImage         = UIImageView()
    var usersFullName        = UILabel()
    let descriptionStackView = UIStackView()
    let genderStackView      = UIStackView()
    let genderLabel          = UILabel()
    var usersGenderLabel     = UILabel()
    let ageStackView         = UIStackView()
    let AgeLabel             = UILabel()
    var usersAgeLabel        = UILabel()
    let hobbyStackView       = UIStackView()
    let hobbyLabel           = UILabel()
    var usersHobbyLabel      = UILabel()

    
    //MARK: viewDidLoad-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        configurationOfImageBackgroundView()
        configurationOfUsersImage()
        configurationOfUsersFullName()
        configurationOfDescriptionStackView()
    }
    
    
    //MARK: ConfigurationOfViews-
    func configurationOfImageBackgroundView() {
        view.addSubview(imageBackgroundView)
        setConstraintsToImageBackgroundView()
        
        imageBackgroundView.backgroundColor = .imageBackground
        imageBackgroundView.frame           = CGRect(x: 0, y: 0, width: 375, height: 304)
    }
    
    
    func configurationOfUsersImage() {
        view.addSubview(personsImage)
        setConstraintsToUsersImage()
        personsImage.layer.borderWidth   = 1
        personsImage.layer.masksToBounds = false
        personsImage.contentMode         = .scaleAspectFit
        personsImage.layer.borderColor   = UIColor.black.cgColor
        personsImage.layer.cornerRadius  = personsImage.frame.height / 2
        personsImage.clipsToBounds       = true
        personsImage.frame               = CGRect(x: 0, y: 0, width: 183, height: 183)
    }
    
    
    func configurationOfUsersFullName() {
        view.addSubview(usersFullName)
        setConstraintsToUsersFullName()
        usersFullName.font          = UIFont.systemFont(ofSize: 22, weight: .regular)
        usersFullName.textColor     = .white
        usersFullName.textAlignment = .center
    }
    
    
    func configurationOfDescriptionStackView() {
        view.addSubview(descriptionStackView)
        setConstraintsToDescriptionStackView()
        
        descriptionStackView.addArrangedSubview(genderStackView)
        descriptionStackView.addArrangedSubview(ageStackView)
        descriptionStackView.addArrangedSubview(hobbyStackView)
        
        configurationOfGenderStackView()
        configurationOfAgeStackView()
        configurationOfHobbyStackView()
        
        descriptionStackView.axis               = .vertical
        descriptionStackView.alignment          = .fill
        descriptionStackView.distribution       = .fillProportionally
        descriptionStackView.backgroundColor    = .white
        descriptionStackView.layer.cornerRadius = 15
    }
    
    
    func configurationOfGenderStackView() {
        genderStackView.addArrangedSubview(genderLabel)
        genderStackView.addArrangedSubview(usersGenderLabel)
        
        configurationOfGenderLabel()
        configurationOfUsersGenderLabel()
        
        genderStackView.axis         = .horizontal
        genderStackView.distribution = .fillEqually
    }
    
    
    func configurationOfGenderLabel() {
        genderLabel.text      = "Gender:"
        genderLabel.font      = UIFont.systemFont(ofSize: 17, weight: .regular)
        genderLabel.textColor = .title
        genderLabel.textAlignment = .left
    }
    
    
    func configurationOfUsersGenderLabel() {
        usersGenderLabel.font          = UIFont.systemFont(ofSize: 17, weight: .regular)
        usersGenderLabel.textColor     = .title
        usersGenderLabel.textAlignment = .right
        usersGenderLabel.numberOfLines = 0
    }
    
    
    func configurationOfAgeStackView() {
        ageStackView.addArrangedSubview(AgeLabel)
        ageStackView.addArrangedSubview(usersAgeLabel)
        
        configurationOfAgeLabel()
        configurationOfUsersAgeLabel()
        
        ageStackView.axis         = .horizontal
        ageStackView.distribution = .fillEqually
    }
    
    
    func configurationOfAgeLabel() {
        AgeLabel.text          = "Age(years):"
        AgeLabel.font          = UIFont.systemFont(ofSize: 17, weight: .regular)
        AgeLabel.textColor     = .title
        AgeLabel.textAlignment = .left
    }
    
    
    func configurationOfUsersAgeLabel() {
        usersAgeLabel.font          = UIFont.systemFont(ofSize: 17, weight: .regular)
        usersAgeLabel.textColor     = .title
        usersAgeLabel.textAlignment = .right
        usersAgeLabel.numberOfLines = 0
    }
    
    
    func configurationOfHobbyStackView() {
        hobbyStackView.addArrangedSubview(hobbyLabel)
        hobbyStackView.addArrangedSubview(usersHobbyLabel)
        
        configurationOfHobbyLabel()
        configurationOfUsersHobbyLabel()
        
        hobbyStackView.axis         = .horizontal
        hobbyStackView.distribution = .fillEqually
    }
    
    
    func configurationOfHobbyLabel() {
        hobbyLabel.text          = "Hobby:"
        hobbyLabel.font          = UIFont.systemFont(ofSize: 17, weight: .regular)
        hobbyLabel.textColor     = .title
        hobbyLabel.textAlignment = .left
    }
    
    
    func configurationOfUsersHobbyLabel() {
        usersHobbyLabel.font          = UIFont.systemFont(ofSize: 17, weight: .regular)
        usersHobbyLabel.textColor     = .title
        usersHobbyLabel.textAlignment = .right
        usersHobbyLabel.numberOfLines = 0
    }
    
    
    //MARK: setConstraints-
    func setConstraintsToImageBackgroundView() {
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageBackgroundView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -508),
        ])
    }
    
    
    func setConstraintsToUsersImage() {
        personsImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personsImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -579),
            personsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            personsImage.heightAnchor.constraint(equalToConstant: 183),
            personsImage.widthAnchor.constraint(equalToConstant: 183)
        ])
    }
    
    
    func setConstraintsToUsersFullName() {
        usersFullName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usersFullName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usersFullName.widthAnchor.constraint(equalToConstant: 230),
            usersFullName.heightAnchor.constraint(equalToConstant: 28),
            usersFullName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -523),
            usersFullName.topAnchor.constraint(equalTo: view.topAnchor, constant: 261)
        ])
    }
    
    
    func setConstraintsToDescriptionStackView() {
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionStackView.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 20),
            descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            descriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            descriptionStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -338)
        ])
    }
}
