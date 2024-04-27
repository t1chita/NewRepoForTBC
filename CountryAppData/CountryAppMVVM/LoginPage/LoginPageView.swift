git //
//  LoginPageView.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 26.04.24.
//

import UIKit

protocol LoginPageViewDelegate: AnyObject {
    func goToMainPage()
}

class LoginPageView: UIView {
    //MARK: UI Components-
    let profilePhotoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.profileButton, for: .normal)
        return button
    }()
    
    let loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        return stackView
    }()
    
    let usersNameStackView: CustomLoginStackView = {
        let stackView = CustomLoginStackView()
        stackView.headerLabel.text = "მომხმარებლის სახელი"
        stackView.textField.placeholder = "შეიყვანეთ მომხარებლის სახელი"
        return stackView
    }()
    
    let usersPasswordtackView: CustomLoginStackView = {
        let stackView = CustomLoginStackView()
        stackView.headerLabel.text = "პაროლი"
        stackView.textField.placeholder = "შეიყვანეთ პაროლი"
        return stackView
    }()
    
    let repeatPasswordStackView: CustomLoginStackView = {
        let stackView = CustomLoginStackView()
        stackView.headerLabel.text = "გაიმეორეთ პაროლი"
        stackView.textField.placeholder = "განმეორებით შეიყვანეთ პაროლი"
        return stackView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("შესვლა", for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        return button
    }()
    
    weak var delegate: LoginPageViewDelegate?
    
    //MARK: Initialization-
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI-
    func setupUI() {
        setProfilePhotoButton()
        setLoginStackView()
        setLoginButton()
    }
    
    //MARK: Set UIComponents-
    func setProfilePhotoButton() {
        addSubview(profilePhotoButton)
        setConstraintsToProfilePhotoButton()
    }
    
    func setLoginStackView() {
        addSubview(loginStackView)
        setConstraintsToLoginStackView()
        loginStackView.addArrangedSubview(usersNameStackView)
        loginStackView.addArrangedSubview(usersPasswordtackView)
        loginStackView.addArrangedSubview(repeatPasswordStackView)

    }
    
    func setLoginButton() {
        addSubview(loginButton)
        setConstraintsToLoginButton()
        loginButton.addAction(UIAction(title: "Go To Main Page", handler: { [weak self] _ in
            self?.delegate?.goToMainPage()
        }), for: .touchUpInside)
    }
    //MARK: Set Constraints-
    func setConstraintsToProfilePhotoButton() {
        NSLayoutConstraint.activate([
            profilePhotoButton.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            profilePhotoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 122),
            profilePhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -122),
            profilePhotoButton.heightAnchor.constraint(equalToConstant: 132),
        ])
    }
    
    func setConstraintsToLoginStackView() {
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: profilePhotoButton.bottomAnchor, constant: 47),
            loginStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            loginStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    } 
     
    func setConstraintsToLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

