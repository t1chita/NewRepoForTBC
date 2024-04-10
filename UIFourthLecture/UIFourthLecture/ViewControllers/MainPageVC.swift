//
//  ViewController.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 09.04.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: -Images-
    let backgroundImage: UIImageView = {
        var image = UIImageView(image: .background)
        return image
    }()
    //MARK: -UILabels-
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .white
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .descriptionLabel
        label.numberOfLines = 0
        return label
    }()
    let nameOfZodiacLabel: UILabel = {
        let label = UILabel()
        label.text = "ზოდიაქოს სახელი"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    //MARK: -UITextFields-
    let searchForZodiacTextField: UITextField = {
        let textField = UITextField()
        textField.addPaddingToTextField()
        textField.placeholder = "მაგ:ლომი"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.zodiacTextFieldBorder.cgColor
        textField.layer.cornerRadius = 4
        return textField
    }()
    //MARK: -UIButtons-
    let goToDescriptionPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.backgroundColor = .nextButton
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
    //MARK: -UIStackViews-
    let headStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    let zodiacSearchBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    let fullPageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        return stackView
    }()
    let prastoiView: UIView = {
        let view = UIView()
        view.backgroundColor?.setStroke()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackground
        addBackgroundImage()
        addFullPageStackView()
    }
    
    func addBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
    func addHeadStackView() {
        fullPageStackView.addArrangedSubview(headStackView)
        headStackView.addArrangedSubview(titleLabel)
        headStackView.addArrangedSubview(descriptionLabel)
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            zodiacSearchBarStackView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    func addZodiacSearchBar() {
        fullPageStackView.addArrangedSubview(zodiacSearchBarStackView)
        zodiacSearchBarStackView.addArrangedSubview(nameOfZodiacLabel)
        zodiacSearchBarStackView.addArrangedSubview(searchForZodiacTextField)
        zodiacSearchBarStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            zodiacSearchBarStackView.heightAnchor.constraint(equalToConstant: 68),
        ])
    }
    func addGoToDescriptionButton() {
        fullPageStackView.addArrangedSubview(goToDescriptionPageButton)
        goToDescriptionPageButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToDescriptionPageButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    func addFullPageStackView() {
        backgroundImage.addSubview(fullPageStackView)
        addHeadStackView()
        fullPageStackView.addArrangedSubview(prastoiView)
        addZodiacSearchBar()
        addGoToDescriptionButton()
        fullPageStackView.setCustomSpacing(25, after: zodiacSearchBarStackView)
        fullPageStackView.translatesAutoresizingMaskIntoConstraints = false
        prastoiView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fullPageStackView.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 71),
            fullPageStackView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -24),
            fullPageStackView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            fullPageStackView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -391),
            prastoiView.heightAnchor.constraint(equalToConstant: 101),
        ])
    }
}
extension UITextField {
    func addPaddingToTextField() {
           let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
           self.leftView = paddingView
           self.leftViewMode = .always
       }
}

//#Preview {
//    MainPageVC()
//}
