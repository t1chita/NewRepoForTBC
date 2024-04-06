//
//  AuthorizationViewController.swift
//  UIThirdLecture
//
//  Created by Temur Chitashvili on 06.04.24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    //MARK: UI Components-
    let logoLockImageView: UIImageView = {
        let logoLockImageView = UIImageView(image: .logoLock)
        return logoLockImageView
    }()
    
    let greetingLabel: UILabel = {
        let greetingLabel = UILabel()
        greetingLabel.text = "მოგესალმებით!"
        greetingLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        greetingLabel.textColor = UIColor.greetingLabel
        return greetingLabel
    }()
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = UIColor.descriptionLabel
        descriptionLabel.layer.opacity = 0.7
        return descriptionLabel
    }()
    let greetingAndDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let authorizationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let halfOfAuthorizationStackView: UIStackView = {
        let halfOfAuthorizationStackView = UIStackView()
        halfOfAuthorizationStackView.axis = .vertical
        return halfOfAuthorizationStackView
    }()
    let authorizationLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.loginButtonCollor.cgColor
        stackView.axis = .vertical
        return stackView
    }()
    let authorizationLabel: UILabel = {
        let authorizationLabel = UILabel()
        authorizationLabel.text = "ავტორიზაცია"
        authorizationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        authorizationLabel.textColor = UIColor.greetingLabel
        authorizationLabel.keyboardLayoutGuide.keyboardDismissPadding = 10
        authorizationLabel.translatesAutoresizingMaskIntoConstraints = false
        authorizationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        authorizationLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return authorizationLabel
    }()
    let nameAndLastNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let nameAndLastNameLabel: UILabel = {
        let nameAndLastNameLabel = UILabel()
        nameAndLastNameLabel.text = "სრული სახელი"
        nameAndLastNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        nameAndLastNameLabel.textColor = UIColor.infoLabels
        return nameAndLastNameLabel
    }()
    let nameAndLastNameTextField: UITextField = {
        let nameAndLastNameTextField = UITextField()
        nameAndLastNameTextField.placeholder = "მაგ: ქეთინო ფერი"
        nameAndLastNameTextField.textColor = UIColor.placeHolders
        nameAndLastNameTextField.layer.borderWidth = 1
        nameAndLastNameTextField.layer.cornerRadius = 4
        return nameAndLastNameTextField
    }()
    let emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "ელ.ფოსტა"
        emailLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        emailLabel.textColor = UIColor.infoLabels
        return emailLabel
    }()
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "მაგ: chita@mail.ru"
        emailTextField.textColor = UIColor.placeHolders
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 4
        return emailTextField
    }()
    let passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let passwordLabel: UILabel = {
        let passwordLAbel = UILabel()
        passwordLAbel.text = "პაროლი"
        passwordLAbel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        passwordLAbel.textColor = UIColor.infoLabels
        return passwordLAbel
    }()
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "მაგ: chitAmagaria123,yvelazesaYvarlebi2019"
        passwordTextField.textColor = UIColor.placeHolders
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 4
        return passwordTextField
    }()

    let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.backgroundColor = UIColor.loginButtonCollor
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = 12
        logInButton.setTitle("შესვლა", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return logInButton
    }()
    let separatorHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    let horizontalViewFirst: UIView = {
       let horizontalViewFirst = UIView()
        horizontalViewFirst.layer.borderWidth = 1
        horizontalViewFirst.layer.borderColor = UIColor.horizontalViewBorder.cgColor
        horizontalViewFirst.translatesAutoresizingMaskIntoConstraints = false
        horizontalViewFirst.widthAnchor.constraint(equalToConstant: 146).isActive = true
        horizontalViewFirst.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return horizontalViewFirst
    }()
    let orLabel: UILabel = {
       let orLabel = UILabel()
        orLabel.text = "ან"
        orLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        orLabel.textColor = UIColor.orLabel
        return orLabel
    }()
    let horizontalViewSecond: UIView = {
       let horizontalViewSecond = UIView()
        horizontalViewSecond.layer.borderWidth = 1
        horizontalViewSecond.layer.borderColor = UIColor.horizontalViewBorder.cgColor
        horizontalViewSecond.translatesAutoresizingMaskIntoConstraints = false
        horizontalViewSecond.widthAnchor.constraint(equalToConstant: 146).isActive = true
        horizontalViewSecond.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return horizontalViewSecond
    }()
    let otherWaysToLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    let useGoogleForLoginButton: UIButton = {
        let useGoogleForLoginButton = UIButton()
        useGoogleForLoginButton.backgroundColor = UIColor.loginOtherWaysButtonBackground
        useGoogleForLoginButton.setTitle("გამოიყენე გუგლი", for: .normal)
        useGoogleForLoginButton.clipsToBounds = true
        useGoogleForLoginButton.layer.cornerRadius = 12
        return useGoogleForLoginButton
    }()
    let useFacebookForLoginButton: UIButton = {
        let useFacebookForLoginButton = UIButton()
        useFacebookForLoginButton.backgroundColor = UIColor.loginOtherWaysButtonBackground
        useFacebookForLoginButton.setTitle("გამოიყენე ფეიზბურგი", for: .normal)
        useFacebookForLoginButton.clipsToBounds = true
        useFacebookForLoginButton.layer.cornerRadius = 12
        return useFacebookForLoginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addLogoImage()
        addGreetingLabelAndDescriptionLabelInStackView()
        addFullAuthorizationStackView()
        
    }
    //MARK: Functions For viewDidLoad-
    func addLogoImage () {
        self.view.addSubview(logoLockImageView)
        logoLockImageView.frame = CGRect(x: 20, y: 20, width: 90, height: 50)
        logoLockImageView.translatesAutoresizingMaskIntoConstraints = false
        logoLockImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoLockImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 143).isActive = true
        logoLockImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoLockImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
    func addGreetingLabelAndDescriptionLabelInStackView () {
        self.view.addSubview(greetingAndDescriptionStackView)
        greetingAndDescriptionStackView.frame = CGRect(x: 100, y: 100, width: 335, height: 126)
        greetingAndDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        greetingAndDescriptionStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        greetingAndDescriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        greetingAndDescriptionStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        greetingAndDescriptionStackView.heightAnchor.constraint(equalToConstant: 126).isActive = true
        greetingAndDescriptionStackView.spacing = 4
        
        greetingAndDescriptionStackView.addArrangedSubview(greetingLabel)
        greetingAndDescriptionStackView.addArrangedSubview(descriptionLabel)
    }
    func addFullAuthorizationStackView() {
        self.view.addSubview(authorizationStackView)
        authorizationStackView.translatesAutoresizingMaskIntoConstraints = false
        authorizationStackView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        authorizationStackView.backgroundColor = .orange
        
        authorizationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 256).isActive = true
        authorizationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        authorizationStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        authorizationStackView.heightAnchor.constraint(equalToConstant: 528).isActive = true
        
        
        addAuthorizationLabelStackView()
        addNameAndLastNameStack()
        addEmailStack()
        addPasswordStackView()
        authorizationStackView.addArrangedSubview(logInButton)
        addSeparatorView()
        addOtherWaysToLogStackView()
    }
    func addAuthorizationLabelStackView() {
        authorizationStackView.addArrangedSubview(authorizationLabelStackView)
        authorizationLabelStackView.addArrangedSubview(authorizationLabel)
        authorizationLabelStackView.alignment = UIStackView.Alignment.center
        authorizationLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        authorizationLabelStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func addNameAndLastNameStack() {
        authorizationStackView.addArrangedSubview(nameAndLastNameStackView)
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameLabel)
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameTextField)
        nameAndLastNameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameAndLastNameStackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        nameAndLastNameStackView.spacing = 4
    }
    func addEmailStack() {
        authorizationStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        emailStackView.spacing = 4
    }
    func addPasswordStackView() {
        authorizationStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        passwordStackView.spacing = 4
    }
    func addSeparatorView() {
        authorizationStackView.addArrangedSubview(separatorHorizontalStackView)
        separatorHorizontalStackView.addArrangedSubview(horizontalViewFirst)
        separatorHorizontalStackView.addArrangedSubview(orLabel)
        separatorHorizontalStackView.addArrangedSubview(horizontalViewSecond)
        separatorHorizontalStackView.alignment = UIStackView.Alignment.center
        separatorHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        separatorHorizontalStackView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        separatorHorizontalStackView.spacing = 11
    }
    func addOtherWaysToLogStackView() {
        authorizationStackView.addArrangedSubview(otherWaysToLoginStackView)
        otherWaysToLoginStackView.addArrangedSubview(useGoogleForLoginButton)
        otherWaysToLoginStackView.addArrangedSubview(useFacebookForLoginButton)
        otherWaysToLoginStackView.translatesAutoresizingMaskIntoConstraints = false
        otherWaysToLoginStackView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        otherWaysToLoginStackView.spacing = 10
    }
    func uniteHalfOfAuthorizationStackView() {
        
    }
    
}

#Preview {
    AuthorizationViewController()
}
