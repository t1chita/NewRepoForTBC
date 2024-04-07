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
    let facebookImageView: UIImageView = {
        let facebookImageView = UIImageView(image: .facebook)
        return facebookImageView
    }()
    let googleImageView: UIImageView = {
        let facebookImageView = UIImageView(image: .google)
        return facebookImageView
    }()
    
    //MARK: UILabels-
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
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = UIColor.descriptionLabel
        descriptionLabel.layer.opacity = 0.7
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    let authorizationLabel: UILabel = {
        let authorizationLabel = UILabel()
        authorizationLabel.text = "ავტორიზაცია"
        authorizationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        authorizationLabel.textColor = UIColor.greetingLabel
        authorizationLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorizationLabel
    }()
    let nameAndLastNameLabel: UILabel = {
        let nameAndLastNameLabel = UILabel()
        nameAndLastNameLabel.text = "სრული სახელი"
        nameAndLastNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        nameAndLastNameLabel.textColor = UIColor.infoLabels
        return nameAndLastNameLabel
    }()
    let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "ელ.ფოსტა"
        emailLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        emailLabel.textColor = UIColor.infoLabels
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    let passwordLabel: UILabel = {
        let passwordLAbel = UILabel()
        passwordLAbel.text = "პაროლი"
        passwordLAbel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        passwordLAbel.textColor = UIColor.infoLabels
        passwordLAbel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLAbel
    }()
    let orLabel: UILabel = {
        let orLabel = UILabel()
        orLabel.text = "ან"
        orLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        orLabel.textColor = UIColor.orLabel
        return orLabel
    }()
    
    //MARK: UITextFields-
    let nameAndLastNameTextField: UITextField = {
        let nameAndLastNameTextField = UITextField()
        nameAndLastNameTextField.addPaddingToTextField()
        nameAndLastNameTextField.placeholder = "მაგ: ქეთინო ფერი"
        nameAndLastNameTextField.textColor = UIColor.placeHolders
        nameAndLastNameTextField.layer.borderWidth = 1
        nameAndLastNameTextField.layer.cornerRadius = 4
        nameAndLastNameTextField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        nameAndLastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameAndLastNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return nameAndLastNameTextField
    }()
    let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.addPaddingToTextField()
        emailTextField.placeholder = "მაგ: chita@mail.ru"
        emailTextField.textColor = UIColor.placeHolders
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.cornerRadius = 4
        emailTextField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return emailTextField
    }()
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.addPaddingToTextField()
        passwordTextField.placeholder = "მაგ: chitAmagaria123,yvelazesaYvarlebi2019"
        passwordTextField.textColor = UIColor.placeHolders
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return passwordTextField
    }()
    
    
    //MARK: UIStackViews-
    let greetingAndDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    let authorizationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
    }()
    let halfOfAuthorizationStackView: UIStackView = {
        let halfOfAuthorizationStackView = UIStackView()
        halfOfAuthorizationStackView.axis = .vertical
        halfOfAuthorizationStackView.alignment = .fill
        halfOfAuthorizationStackView.spacing = 8
        halfOfAuthorizationStackView.distribution = .equalCentering
        return halfOfAuthorizationStackView
    }()
    let authorizationLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.borderWidth = 2
        stackView.layer.borderColor = UIColor.loginButtonCollor.cgColor
        stackView.axis = .vertical
        return stackView
    }()
    let nameAndLastNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    let emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4

        return stackView
    }()
    let passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    let separatorHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 11
        return stackView
    }()
    let otherWaysToLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    //MARK: UIVIEWS-
    let horizontalViewFirst: UIView = {
       let horizontalViewFirst = UIView()
        horizontalViewFirst.layer.borderWidth = 1
        horizontalViewFirst.layer.borderColor = UIColor.horizontalViewBorder.cgColor
        horizontalViewFirst.translatesAutoresizingMaskIntoConstraints = false
        horizontalViewFirst.widthAnchor.constraint(equalToConstant: 146).isActive = true
        horizontalViewFirst.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return horizontalViewFirst
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
    //MARK: UIBUTTONS-
    let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.backgroundColor = UIColor.loginButtonCollor
        logInButton.setTitle("შესვლა", for: .normal)
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = 12
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return logInButton
    }()
    let useGoogleForLoginButton: UIButton = {
        let useGoogleForLoginButton = UIButton()
        useGoogleForLoginButton.backgroundColor = UIColor.loginOtherWaysButtonBackground
        useGoogleForLoginButton.setTitle("გამოიყენე გუგლი", for: .normal)
        useGoogleForLoginButton.clipsToBounds = true
        useGoogleForLoginButton.layer.cornerRadius = 12
        useGoogleForLoginButton.setTitleColor(.black, for: .normal)
        useGoogleForLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        useGoogleForLoginButton.translatesAutoresizingMaskIntoConstraints = false
        return useGoogleForLoginButton
    }()
    let useFacebookForLoginButton: UIButton = {
        let useFacebookForLoginButton = UIButton()
        useFacebookForLoginButton.backgroundColor = UIColor.loginOtherWaysButtonBackground
        useFacebookForLoginButton.setTitle("გამოიყენე ფეიზბურგი", for: .normal)
        useFacebookForLoginButton.clipsToBounds = true
        useFacebookForLoginButton.layer.cornerRadius = 12
        useFacebookForLoginButton.setTitleColor(.black, for: .normal)
        useFacebookForLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
        logoLockImageView.frame = CGRect(x: 0, y: 0, width: 90, height: 50)
        logoLockImageView.translatesAutoresizingMaskIntoConstraints = false
        logoLockImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoLockImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 143).isActive = true
        logoLockImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -143).isActive = true
        logoLockImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func addGreetingLabelAndDescriptionLabelInStackView () {
        self.view.addSubview(greetingAndDescriptionStackView)
        greetingAndDescriptionStackView.frame = CGRect(x: 0, y: 0, width: 335, height: 126)
        
        greetingAndDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        greetingAndDescriptionStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        greetingAndDescriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        greetingAndDescriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        greetingAndDescriptionStackView.heightAnchor.constraint(equalToConstant: 126).isActive = true
        
        greetingAndDescriptionStackView.addArrangedSubview(greetingLabel)
        greetingAndDescriptionStackView.addArrangedSubview(descriptionLabel)
    }
    func addFullAuthorizationStackView() {
        self.view.addSubview(authorizationStackView)
        authorizationStackView.translatesAutoresizingMaskIntoConstraints = false
        authorizationStackView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        authorizationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 256).isActive = true
        authorizationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        authorizationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        authorizationStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28).isActive = true
        
        
        addAuthorizationLabelStackView()
        addHalfOfAuthorizationStackView()
        addSeparatorView()
        addOtherWaysToLogStackView()
    }
    func addAuthorizationLabelStackView() {
        authorizationLabelStackView.addArrangedSubview(authorizationLabel)
        
        authorizationStackView.addArrangedSubview(authorizationLabelStackView)
        
        authorizationLabelStackView.alignment = UIStackView.Alignment.center
        authorizationLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        authorizationLabelStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func addNameAndLastNameStack() {
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameLabel)
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameTextField)
        
        halfOfAuthorizationStackView.addArrangedSubview(nameAndLastNameStackView)
        
    }
    func addEmailStack() {
        halfOfAuthorizationStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
      
    }
    func addPasswordStackView() {
        halfOfAuthorizationStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
     
    }
    func addSeparatorView() {
        authorizationStackView.addArrangedSubview(separatorHorizontalStackView)
        separatorHorizontalStackView.addArrangedSubview(horizontalViewFirst)
        separatorHorizontalStackView.addArrangedSubview(orLabel)
        separatorHorizontalStackView.addArrangedSubview(horizontalViewSecond)
        separatorHorizontalStackView.alignment = UIStackView.Alignment.center
        separatorHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        separatorHorizontalStackView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    func addOtherWaysToLogStackView() {
        authorizationStackView.addArrangedSubview(otherWaysToLoginStackView)
        otherWaysToLoginStackView.addArrangedSubview(useGoogleForLoginButton)
        otherWaysToLoginStackView.addArrangedSubview(useFacebookForLoginButton)
    }
    func addHalfOfAuthorizationStackView() {
        addNameAndLastNameStack()
        addEmailStack()
        addPasswordStackView()
        
        halfOfAuthorizationStackView.addArrangedSubview(logInButton)
        
        authorizationStackView.addArrangedSubview(halfOfAuthorizationStackView)
        halfOfAuthorizationStackView.setCustomSpacing(16, after: passwordStackView)
        halfOfAuthorizationStackView.translatesAutoresizingMaskIntoConstraints = false
        halfOfAuthorizationStackView.heightAnchor.constraint(equalToConstant: 282).isActive = true
    }
    
}


extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

#Preview {
    AuthorizationViewController()
}
