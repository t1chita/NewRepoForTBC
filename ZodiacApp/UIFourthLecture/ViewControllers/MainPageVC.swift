//
//  MainPage.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 09.04.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: UI Components-
    let backgroundImage: UIImageView = {
        var image = UIImageView(image: .background)
        return image
    }()
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
    let searchForZodiacTextField: UITextField = {
        let textField = UITextField()
        textField.addPaddingToTextField()
        textField.placeholder = "მაგ:ლომი"
        textField.layer.borderWidth = 1
        textField.textColor = .white
        textField.layer.borderColor = UIColor.zodiacTextFieldBorder.cgColor
        textField.layer.cornerRadius = 4
        return textField
    }()
    let goToDescriptionPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.backgroundColor = .nextButton
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        return button
    }()
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
    let emptyView: UIView = {
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
    
    //MARK: Methods-
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
    }
    func addZodiacSearchBar() {
        fullPageStackView.addArrangedSubview(zodiacSearchBarStackView)
        zodiacSearchBarStackView.addArrangedSubview(nameOfZodiacLabel)
        zodiacSearchBarStackView.addArrangedSubview(searchForZodiacTextField)
        zodiacSearchBarStackView.translatesAutoresizingMaskIntoConstraints = false
        zodiacSearchBarStackView.heightAnchor.constraint(equalToConstant: 68).isActive = true
    }
    func addGoToDescriptionButton() {
        fullPageStackView.addArrangedSubview(goToDescriptionPageButton)
        goToDescriptionPageButton.translatesAutoresizingMaskIntoConstraints = false
        goToDescriptionPageButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        goToDescriptionPageButton.addTarget(self, action: #selector(tapGoToDescriptionButton), for: .touchUpInside)
    }
    func addFullPageStackView() {
        view.addSubview(fullPageStackView)
        addHeadStackView()
        fullPageStackView.addArrangedSubview(emptyView)
        addZodiacSearchBar()
        addGoToDescriptionButton()
        fullPageStackView.setCustomSpacing(25, after: zodiacSearchBarStackView)
        fullPageStackView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullPageStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 71),
            fullPageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            fullPageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            fullPageStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -391),
            emptyView.heightAnchor.constraint(equalToConstant: 101),
        ])
    }
    //MARK: Button objc methods-
    @objc func tapGoToDescriptionButton() {
        let descriptionPageVC = DescriptionPageVC()
        switch searchForZodiacTextField.text {
        case "ვერძი","Aries" :
            descriptionPageVC.zodiacSignNameLabel.text = aries.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = aries.description
            descriptionPageVC.zodiacSignImage = aries.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "კურო", "Taurus" :
            descriptionPageVC.zodiacSignNameLabel.text = taurus.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = taurus.description
            descriptionPageVC.zodiacSignImage = taurus.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "ტყუპები", "Gemini" :
            descriptionPageVC.zodiacSignNameLabel.text = gemini.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = gemini.description
            descriptionPageVC.zodiacSignImage = gemini.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "კირჩხიბი", "Cancer" :
            descriptionPageVC.zodiacSignNameLabel.text = cancer.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = cancer.description
            descriptionPageVC.zodiacSignImage = cancer.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "ლომი", "Leo" :
            descriptionPageVC.zodiacSignNameLabel.text = leo.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = leo.description
            descriptionPageVC.zodiacSignImage = leo.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "ქალწული", "Virgo" :
            descriptionPageVC.zodiacSignNameLabel.text = virgo.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = virgo.description
            descriptionPageVC.zodiacSignImage = virgo.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "სასწორი", "Libra" :
            descriptionPageVC.zodiacSignNameLabel.text = libra.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = libra.description
            descriptionPageVC.zodiacSignImage = libra.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "მორიელი", "Scorpio" :
            descriptionPageVC.zodiacSignNameLabel.text = scorpio.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = scorpio.description
            descriptionPageVC.zodiacSignImage = scorpio.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "მშვილდოსანი", "Sagittarius" :
            descriptionPageVC.zodiacSignNameLabel.text = sagittarius.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = sagittarius.description
            descriptionPageVC.zodiacSignImage = sagittarius.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "თხის რქა", "Capricorn" :
            descriptionPageVC.zodiacSignNameLabel.text = capricorn.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = capricorn.description
            descriptionPageVC.zodiacSignImage = capricorn.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "მერწყული", "Aquarius" :
            descriptionPageVC.zodiacSignNameLabel.text = aquarius.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = aquarius.description
            descriptionPageVC.zodiacSignImage = aquarius.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        case "თევზები", "Pisces" :
            descriptionPageVC.zodiacSignNameLabel.text = pisces.name
            descriptionPageVC.zodiacSignDescriptionTextView.text = pisces.description
            descriptionPageVC.zodiacSignImage = pisces.signImage
            self.navigationController?.pushViewController(descriptionPageVC, animated: true)
        default :
            self.present(FalseConditionVC(), animated: true)
        }
    }
}
//MARK:  Extensions-
extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
extension UIViewController: ColorChangable {
    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
}

//#Preview {
//    MainPageVC()
//}
