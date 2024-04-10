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
        let imageView = UIImageView(image: .logoLock)
        return imageView
    }()
    let facebookImage: UIImage = {
        let image = UIImage.facebook
        return image
    }()
    let googleImage: UIImage = {
        let image = UIImage.google
        return image
    }()
    //MARK: UILabels-
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = UIColor.greetingLabel
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.descriptionLabel
        label.layer.opacity = 0.7
        label.numberOfLines = 0
        return label
    }()
    let authorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "ავტორიზაცია"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.authorizationLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let nameAndLastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "სრული სახელი"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.infoLabels
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ელ.ფოსტა"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.infoLabels
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "პაროლი"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.infoLabels
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "ან"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.orLabel
        return label
    }()
    //MARK: UITextFields-
    let nameAndLastNameTextField: UITextField = {
        let textField = UITextField()
        textField.addPaddingToTextField()
        textField.placeholder = "მაგ: ქეთინო ფერი"
        textField.textColor = UIColor.placeHolders
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.layer.borderColor = UIColor.textFieldBorder.cgColor
        return textField
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.addPaddingToTextField()
        textField.placeholder = "მაგ: chita@mail.ru"
        textField.textColor = UIColor.placeHolders
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.layer.borderColor = UIColor.textFieldBorder.cgColor
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.addPaddingToTextField()
        textField.placeholder = "მაგ: chitAmagaria123,yvelazesaYvarlebi2019"
        textField.textColor = UIColor.placeHolders
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.layer.borderColor = UIColor.textFieldBorder.cgColor
        return textField
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
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
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
    let horizontalViewForAuthorizationLabel: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.loginButtonCollor
        return view
    }()
    let horizontalViewFirst: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.horizontalViewBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 146).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    let horizontalViewSecond: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.horizontalViewBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 146).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    //MARK: UIBUTTONS-
    let logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.loginButtonCollor
        button.setTitle("შესვლა", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return button
    }()
    let useGoogleForLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.loginOtherWaysButtonBackground
        button.setTitle("გამოიყენე გუგლი", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setImage(.google, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }()
    let useFacebookForLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.loginOtherWaysButtonBackground
        button.setTitle("გამოიყენე ფეიზბურგი", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return button
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
        logoLockImageView.contentMode = .scaleAspectFill
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
        addHorizontalBlueView()
        addHalfOfAuthorizationStackView()
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
    func addHorizontalBlueView() {
        authorizationLabelStackView.addArrangedSubview(horizontalViewForAuthorizationLabel)
        horizontalViewForAuthorizationLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalViewForAuthorizationLabel.heightAnchor.constraint(equalToConstant: 2).isActive = true
        horizontalViewForAuthorizationLabel.widthAnchor.constraint(equalTo: authorizationLabelStackView.widthAnchor).isActive = true
    }
    func addNameAndLastNameStack() {
        halfOfAuthorizationStackView.addArrangedSubview(nameAndLastNameStackView)
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameLabel)
        nameAndLastNameStackView.addArrangedSubview(nameAndLastNameTextField)
        nameAndLastNameTextField.addAction(UIAction(title: "Check Valid Name And Lastname", handler: { [weak self] _ in
            self?.nameAndLastNameTextField.checkIsNameAndLastNameValid()
        }), for: .editingDidEnd)
    }
    func addEmailStack() {
        halfOfAuthorizationStackView.addArrangedSubview(emailStackView)
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailTextField.addAction(UIAction(title: "Check Valid Gmail", handler: { [weak self] _ in
            self?.emailTextField.checkIsGmailValid()
        }), for: .editingDidEnd)
    }
    func addPasswordStackView() {
        halfOfAuthorizationStackView.addArrangedSubview(passwordStackView)
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordTextField.addAction(UIAction(title: "Restriction Of Symbols Count", handler: { [weak self] _ in
            self?.passwordTextField.checkIsPasswordValid()
        }), for: .editingDidEnd)
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
        let newFacebookImage = facebookImage.resized(toSize: CGSize(width: 24, height: 24))
        let newGoogleImage = googleImage.resized(toSize: CGSize(width: 24, height: 24))
        useFacebookForLoginButton.setImage(newFacebookImage, for: .normal)
        useGoogleForLoginButton.setImage(newGoogleImage, for: .normal)
        otherWaysToLoginStackView
            .translatesAutoresizingMaskIntoConstraints = false
        otherWaysToLoginStackView.heightAnchor.constraint(equalToConstant: 112).isActive = true
    }
    func addHalfOfAuthorizationStackView() {
        addNameAndLastNameStack()
        addEmailStack()
        addPasswordStackView()
        
        halfOfAuthorizationStackView.addArrangedSubview(logInButton)
        authorizationStackView.addArrangedSubview(halfOfAuthorizationStackView)
        halfOfAuthorizationStackView.setCustomSpacing(16, after: passwordStackView)
        halfOfAuthorizationStackView.translatesAutoresizingMaskIntoConstraints = false
    }
}


//MARK: extension For TextField
extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func checkIsNameAndLastNameValid() {
        guard let unwrappedTextField = self.text else {return}
        if unwrappedTextField == "" {
            self.layer.borderColor = UIColor.red.cgColor
            return
        }
        self.deleteNeedlessSpaces()
        for char in unwrappedTextField {
            if (char >= "A" && char <= "Z") || (char >= "a" && char <= "z" || char == " ") {
                self.layer.borderColor = UIColor.green.cgColor
            }else {
                self.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    func deleteNeedlessSpaces() {
        var arrOfMyString: [Character] = []
        var index = 0
        guard let unwrappedTextField = self.text else {return}
        for char in unwrappedTextField {
            arrOfMyString.append(char)
        }
        for _ in 0..<arrOfMyString.count - 1 {
            if arrOfMyString[index] == " " && arrOfMyString[index + 1] == " "  {
                arrOfMyString.remove(at: index)
                continue
            }
            index += 1
        }
        if arrOfMyString[arrOfMyString.count - 1] == " " {
            arrOfMyString.remove(at: arrOfMyString.count - 1)
        }
        self.text = ""
        for char in arrOfMyString {
            self.text?.append(char)
        }
    }
    func checkIsPasswordValid() {
        guard let unwrappedTextField = self.text else {return}
        if unwrappedTextField == "" {
            self.layer.borderColor = UIColor.red.cgColor
        }
        if unwrappedTextField.count < 6 || unwrappedTextField.count > 15 {
            self.layer.borderColor = UIColor.red.cgColor
        }else {
            self.layer.borderColor = UIColor.green.cgColor
        }
    }
    func checkIsGmailValid() {
        var arrOfString:[Character] = []
        var tempString = ""
        var index = 0
        guard let unwrappedTextField = self.text else {return}
        if unwrappedTextField == "" {
            self.layer.borderColor = UIColor.red.cgColor
        }
        for char in unwrappedTextField {
            arrOfString.append(char)
        }
        for char in arrOfString {
            if char != "@" {
                arrOfString.remove(at: index)
                continue
            }else if char == "@" {
                break
            }
            index += 1
        }
        for char in arrOfString {
            tempString.append(char)
        }
        if tempString == "@gmail.com" || tempString == "@mail.ru" || tempString == "@yahoo.com" {
            self.layer.borderColor = UIColor.green.cgColor
        }else {
            self.layer.borderColor = UIColor.red.cgColor
        }
    }
}
//MARK: extension For Image
extension UIImage {
    func resized(toSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}



#Preview {
    AuthorizationViewController()
}
