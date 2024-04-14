//
//  AddNewCardPageVC.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

class AddNewCardPageVC: UIViewController {
    
    
    //MARK: UI Components-
    let backgroundImage = UIImageView()
    
    let fullStackView              = UIStackView()
    let headerStackView            = UIStackView()
    let descriptionStackView       = UIStackView()
    let fullChooseButtonsStackView = UIStackView()
    let buttonsStackView           = UIStackView()
    
    let headerLabel      = UILabel()
    let descriptionLabel = UILabel()
    let chooseIconLabel  = UILabel()
    
    let headerTextField      = UITextField()
    let descriptionTextField = UITextField()

    let redIcon    = UIButton()
    let purpleIcon = UIButton()
    let greenIcon  = UIButton()
    let goldIcon   = UIButton()
    let addButton  = UIButton()
    
    var delegate: PostAddable?
    var newPostForSend = Post(icon: UIImageView(image: .defaultAlert), headerLabel: "", descriptionLabel: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setBackgroundImage()
        setHeaderStackView()
        setDescriptionStackView()
        setFullChooseButtonsStackView()
        setAddButton()
    }
    
    //MARK: configuration Of UI Components-
    func setBackgroundImage() {
        view.addSubview(backgroundImage)
        setConstraintsToBackgroundImage()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode                               = .scaleAspectFill
        backgroundImage.image                                     = .background
    }
    
    func setHeaderStackView() {
        headerStackView.addArrangedSubview(headerLabel)
        headerStackView.addArrangedSubview(headerTextField)
        view.addSubview(headerStackView)
        setConstraintsToHeaderStackView()
        setHeaderTextField()
        setHeaderLabel()
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.distribution = .fillProportionally
        headerStackView.alignment    = .fill
        headerStackView.spacing      = 3
        headerStackView.axis         = .vertical
    }
    
    func setHeaderLabel() {
        headerLabel.textColor = .white
        headerLabel.frame     = CGRect(x: 0, y: 0, width: 62, height: 24)
        headerLabel.text      = "სათაური"
        headerLabel.font      = UIFont(name: "FiraGO-SemiBold", size: 14)
    }
    
    func setHeaderTextField() {
        headerTextField.addPaddingToTextField()
        headerTextField.layer.cornerRadius    = 9
        headerTextField.layer.borderWidth     = 1
        headerTextField.layer.borderColor     = UIColor.textFieldBorder.cgColor
        headerTextField.clipsToBounds         = true
        headerTextField.textColor             = .white
        headerTextField.frame                 = CGRect(x: 0, y: 0, width: 310, height: 45)
        headerTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: დალევა და ქეიფი,როგორ დავანებოთ მოწევას თავი",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderText,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium),
                        ])
    }
    
    func setDescriptionStackView() {
        descriptionStackView.addArrangedSubview(descriptionLabel)
        descriptionStackView.addArrangedSubview(descriptionTextField)
        view.addSubview(descriptionStackView)
        setConstraintsToDescriptionStackView()
        setDescriptionLabel()
        setDescriptinTextField()
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.distribution = .fillProportionally
        descriptionStackView.alignment    = .fill
        descriptionStackView.spacing      = 3
        descriptionStackView.axis         = .vertical
    }
    
    func setDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.frame     = CGRect(x: 0, y: 0, width: 62, height: 24)
        descriptionLabel.text      = "აღწერა"
        descriptionLabel.font      = UIFont(name: "FiraGO-Medium", size: 14)
    }
    
    func setDescriptinTextField() {
        descriptionTextField.addPaddingToTextField()
        descriptionTextField.layer.cornerRadius    = 9
        descriptionTextField.layer.borderWidth     = 1
        descriptionTextField.layer.borderColor     = UIColor.textFieldBorder.cgColor
        descriptionTextField.clipsToBounds         = true
        descriptionTextField.textColor             = .white
        descriptionTextField.frame                 = CGRect(x: 0, y: 0, width: 310, height: 45)
        descriptionTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: წავიდეთ ფიროსმანში ვალიკო პაპასთან",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderText,
                         NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium),
                        ])
    }
    
    
    func setFullChooseButtonsStackView() {
        view.addSubview(fullChooseButtonsStackView)
        fullChooseButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsTofullChooseButtonsStackView()
        fullChooseButtonsStackView.addArrangedSubview(chooseIconLabel)
        fullChooseButtonsStackView.addArrangedSubview(buttonsStackView)
        setButtonsStackView()
        setChooseIconLabel()
        fullChooseButtonsStackView.distribution = .fillProportionally
        fullChooseButtonsStackView.alignment    = .fill
        fullChooseButtonsStackView.spacing      = 14
        fullChooseButtonsStackView.axis         = .vertical
    }
    
    func setButtonsStackView() {
        buttonsStackView.addArrangedSubview(redIcon)
        buttonsStackView.addArrangedSubview(purpleIcon)
        buttonsStackView.addArrangedSubview(greenIcon)
        buttonsStackView.addArrangedSubview(goldIcon)
        setAllButtonIcons()
        buttonsStackView.distribution = .fillProportionally
        buttonsStackView.alignment    = .fill
        buttonsStackView.spacing      = 24
        buttonsStackView.axis         = .horizontal
    }
    
    func setChooseIconLabel() {
        chooseIconLabel.textColor = .white
        chooseIconLabel.frame     = CGRect(x: 0, y: 0, width: 116, height: 24)
        chooseIconLabel.text      = "აირჩიეთ აიქონი"
        chooseIconLabel.font      = UIFont(name: "FiraGO-Medium", size: 14)
    }
    
    func setAllButtonIcons() {
        redIcon.setImage(.redIcon, for: .normal)
        redIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        redIcon.addAction(UIAction(title: "Store Data In New Post", handler: { [weak self] _ in
            self?.storeDataInNewPost(image: self!.purpleIcon.currentImage!)
        }), for: .touchUpInside)
        purpleIcon.setImage(.purpleIcon, for: .normal)
        purpleIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        purpleIcon.addAction(UIAction(title: "Store Data In New Post", handler: { [weak self] _ in
            self?.storeDataInNewPost(image: self!.purpleIcon.currentImage!)
        }), for: .touchUpInside)
        greenIcon.setImage(.greenIcon, for: .normal)
        greenIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        greenIcon.addAction(UIAction(title: "Store Data In New Post", handler: { [weak self] _ in
            self?.storeDataInNewPost(image: self!.greenIcon.currentImage!)
        }), for: .touchUpInside)
        goldIcon.setImage(.goldIcon, for: .normal)
        goldIcon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        goldIcon.addAction(UIAction(title: "Store Data In New Post", handler: { [weak self] _ in
            self?.storeDataInNewPost(image: self!.goldIcon.currentImage!)
        }), for: .touchUpInside)
    }
    
    func setAddButton() {
        view.addSubview(addButton)
        setConstraintsToAddButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.titleLabel?.textAlignment                 = .center
        addButton.layer.cornerRadius                        = 25
        addButton.backgroundColor                           = .addButton
        addButton.clipsToBounds                             = true
        addButton.titleLabel?.font                          = UIFont(name: "FiraGO-Medium", size: 14)
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitle("დამატება", for: .normal)
        addButton.addAction(UIAction(title: "Add New Post On Main Page And Go To Main Page", handler: { [weak self] _ in
            self?.addNewPostOnMainPageAndGoToMainPage()
        }), for: .touchUpInside)
    }
    
    //MARK: set Constraints-
    func setConstraintsToBackgroundImage() {
        NSLayoutConstraint.activate([
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
    
    func setConstraintsToHeaderStackView() {
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            headerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -649),
            headerStackView.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
    
    func setConstraintsToDescriptionStackView() {
        NSLayoutConstraint.activate([
            descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            descriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            descriptionStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -566),
            descriptionStackView.heightAnchor.constraint(equalToConstant: 72),
        ])
    }
    
    func setConstraintsTofullChooseButtonsStackView() {
        NSLayoutConstraint.activate([
            fullChooseButtonsStackView.heightAnchor.constraint(equalToConstant: 78),
            fullChooseButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            fullChooseButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            fullChooseButtonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -459),
        ])
    }
    
    func setConstraintsToAddButton() {
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -103),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121),
        ])
    }
    
    //MARK: Methods For Button Actions
    func storeDataInNewPost(image: UIImage) {
        guard let headerText = self.headerTextField.text else {
            return
        }
        guard let descriptionText = self.descriptionTextField.text else {
            return
        }
        self.newPostForSend = Post(icon: UIImageView(image: image), headerLabel: headerText, descriptionLabel: descriptionText)
    }
    
    func addNewPostOnMainPageAndGoToMainPage() {
        let alert = UIAlertController(title: "🚨ERROR🚨", message: "თქვენ არ მიგითითებიათ სწორი ინფორმაცია,გთხოვთ მიუთითოთ XELTAVIDAN!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        if  newPostForSend.descriptionLabel != ""  && newPostForSend.headerLabel != ""  && newPostForSend.icon.image != .defaultAlert {
            navigationController?.popViewController(animated: true)
            self.delegate?.add(post: self.newPostForSend)
        } else {
            self.present(alert,animated: true, completion: nil)
        }
    }
}

//MARK: ExtensionsFor UITextField
extension UITextField {
    func addPaddingToTextField() {
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
