//
//  CountryDetailsPageVC.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 20.04.24.
//

import UIKit

class CountryDetailsPageVC: UIViewController {
    //MARK: UI Components-
    let chevronSymbol = UIButton()
    let countriesName = UILabel()
    
    let scrollView = UIScrollView()
    
    let conteinerView = UIView()
    
    let countriesHeaderStackView = UIStackView()
    let countriesFlag = UIImageView()
    let aboutTheFlagTitle = UILabel()
    let aboutTheFlagDescription = UITextView()
    
    let lineViewOne = UIView()
    
    let basicInformationLabel = UILabel()
    let basicInformationStackView = UIStackView()
    
    let lineViewTwo = UIView()
    
    let mapsStackView = UIStackView()
    let mapsHeaderLabel = UILabel()
    let iosMapButton = UIButton()
    let googleMapButton = UIButton()
    
    //MARK: Life Cycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: Setup UI-
    func setupUI() {
        setChevronSymbol()
        setCountriesName()
        setScrollView()
        setMapsHeaderLabel()
        setMapsStackView()
    }
    
    //MARK: Set UI Components-
    func setChevronSymbol() {
        view.addSubview(chevronSymbol)
        chevronSymbol.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToChevronSymbol()
        chevronSymbol.setImage(UIImage(systemName: "chevron.left")?.withTintColor(.black,renderingMode: .alwaysOriginal), for: .normal)
        chevronSymbol.addAction(UIAction(title: "Back To Main PageVC", handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    func setCountriesName() {
        view.addSubview(countriesName)
        countriesName.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountriesName()
        countriesName.textAlignment = .center
        countriesName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        countriesName.textColor = .black
    }
    
    func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(conteinerView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToScrollView()
        setContainerView()
    }
    
    func setContainerView() {
        conteinerView.addSubview(countriesHeaderStackView)
        conteinerView.addSubview(lineViewOne)
        conteinerView.addSubview(basicInformationLabel)
        conteinerView.addSubview(basicInformationStackView)
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToContainerView()
        setCountriesHeaderStackView()
        setLineViews()
        setBasicInformationLAbel()
        setBasicInformationStackView()
    }
    
    func setCountriesHeaderStackView() {
        setCountriesFlag()
        setAboutTheFlagTitle()
        setAboutTheFlagDescription()
        countriesHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountriesHeaderStackView()
        countriesHeaderStackView.axis = .vertical
        countriesHeaderStackView.alignment = .fill
        countriesHeaderStackView.distribution = .fillProportionally
        countriesHeaderStackView.spacing = 20
    }
    
    func setCountriesFlag() {
        countriesHeaderStackView.addArrangedSubview(countriesFlag)
        countriesFlag.heightAnchor.constraint(equalToConstant: 228).isActive = true
        countriesFlag.layer.cornerRadius = 30
        countriesFlag.layer.masksToBounds = true
        countriesFlag.layer.shadowColor = UIColor.gray.cgColor
        countriesFlag.layer.shadowOffset = CGSizeMake(0, 1)
        countriesFlag.layer.shadowOpacity = 1
        countriesFlag.layer.shadowRadius = 1.0
    }
    
    func setAboutTheFlagTitle() {
        countriesHeaderStackView.addArrangedSubview(aboutTheFlagTitle)
        aboutTheFlagTitle.text = "About the Flag:"
        aboutTheFlagTitle.heightAnchor.constraint(equalToConstant: 19).isActive = true
        aboutTheFlagTitle.textAlignment = .left
        aboutTheFlagTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        aboutTheFlagTitle.textColor = .black
    }
    
    func setAboutTheFlagDescription() {
        countriesHeaderStackView.addArrangedSubview(aboutTheFlagDescription)
        aboutTheFlagDescription.heightAnchor.constraint(equalToConstant: 85).isActive = true
        aboutTheFlagDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        aboutTheFlagDescription.textColor = .black
        aboutTheFlagDescription.isEditable = false
    }
    
    func setLineViews() {
        view.addSubview(lineViewTwo)
        lineViewOne.backgroundColor = UIColor.line
        lineViewOne.translatesAutoresizingMaskIntoConstraints = false
        lineViewTwo.backgroundColor = UIColor.line
        lineViewTwo.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToLineViews()
    }
    
    func setBasicInformationLAbel() {
        setConstraintsToBasicInformationLabel()
        basicInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        basicInformationLabel.text = "Basic Information:"
        basicInformationLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        basicInformationLabel.textAlignment = .left
        basicInformationLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        basicInformationLabel.textColor = .black
    }
    
    func setBasicInformationStackView() {
        basicInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToBasicInformationStackView()
        basicInformationStackView.axis = .vertical
        basicInformationStackView.alignment = .fill
        basicInformationStackView.distribution = .fillProportionally
        basicInformationStackView.spacing = 15
        setbasicInformationStackView()
    }
    
    func setbasicInformationStackView() {
        var index = 0
        for stackView in stackViews {
            basicInformationStackView.addArrangedSubview(stackView)
        }
        for stackView in stackViews {
            stackView.generalLabel.text = generalLabelsTexts[index]
            index += 1
        }
    }
    
    func setMapsStackView() {
        view.addSubview(mapsStackView)
        mapsStackView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToMapsStackView()
        mapsStackView.axis = .horizontal
        mapsStackView.alignment = .fill
        mapsStackView.distribution = .equalSpacing
        setIosMapButton()
        setGoogleMapButton()
    }
    
    func setMapsHeaderLabel() {
        view.addSubview(mapsHeaderLabel)
        setConstraintsToMapsHeaderLabel()
        mapsHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        mapsHeaderLabel.text = "Useful Links:"
        mapsHeaderLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        mapsHeaderLabel.textColor = .black
        mapsHeaderLabel.textAlignment = .left
        setIosMapButton()
        setGoogleMapButton()
    }
    
    func setIosMapButton() {
        mapsStackView.addArrangedSubview(iosMapButton)
        iosMapButton.setImage(.openStreetMap, for: .normal)
        iosMapButton.frame.size = CGSize(width: 50, height: 50)
        iosMapButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setGoogleMapButton() {
        mapsStackView.addArrangedSubview(googleMapButton)
        googleMapButton.setImage(.googleMap, for: .normal)
        googleMapButton.frame.size = CGSize(width: 50, height: 50)
        googleMapButton.layer.cornerRadius = googleMapButton.frame.size.height / 2
    }
    
    //MARK: Set Constraints To UI Components-
    func setConstraintsToChevronSymbol() {
        NSLayoutConstraint.activate([
            chevronSymbol.topAnchor.constraint(equalTo: view.topAnchor, constant: 43),
            chevronSymbol.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            chevronSymbol.heightAnchor.constraint(equalToConstant: 15),
            chevronSymbol.widthAnchor.constraint(equalToConstant: 11),
        ])
    }
    
    func setConstraintsToCountriesName() {
        NSLayoutConstraint.activate([
            countriesName.topAnchor.constraint(equalTo: view.topAnchor, constant: 43),
            countriesName.heightAnchor.constraint(equalToConstant: 20),
            countriesName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setConstraintsToCountriesHeaderStackView() {
        NSLayoutConstraint.activate([
            countriesHeaderStackView.topAnchor.constraint(equalTo: conteinerView.topAnchor),
            countriesHeaderStackView.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            countriesHeaderStackView.widthAnchor.constraint(equalTo: conteinerView.widthAnchor)
        ])
    }
    
    func setConstraintsToScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: countriesName.bottomAnchor, constant: 29),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -154)
        ])
    }
    
    func setConstraintsToContainerView() {
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            conteinerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            conteinerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 343),
            conteinerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2.2)
        ])
    }
    
    func setConstraintsToBasicInformationLabel() {
        NSLayoutConstraint.activate([
            basicInformationLabel.topAnchor.constraint(equalTo: lineViewOne.bottomAnchor, constant: 24),
            basicInformationLabel.leadingAnchor.constraint(equalTo: countriesHeaderStackView.leadingAnchor),
            basicInformationLabel.heightAnchor.constraint(equalToConstant: 19),
        ])
    }
    
    func setConstraintsToBasicInformationStackView() {
        NSLayoutConstraint.activate([
            basicInformationStackView.topAnchor.constraint(equalTo: basicInformationLabel.topAnchor, constant: 30),
            basicInformationStackView.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            basicInformationStackView.widthAnchor.constraint(equalTo: countriesHeaderStackView.widthAnchor),
        ])
    }
    
    func setConstraintsToLineViews() {
        NSLayoutConstraint.activate([
            lineViewOne.topAnchor.constraint(equalTo: countriesHeaderStackView.bottomAnchor, constant: 1),
            lineViewOne.heightAnchor.constraint(equalToConstant: 1),
            lineViewOne.widthAnchor.constraint(equalTo: countriesHeaderStackView.widthAnchor),
            lineViewOne.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            lineViewTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            lineViewTwo.heightAnchor.constraint(equalToConstant: 1),
            lineViewTwo.widthAnchor.constraint(equalTo: conteinerView.widthAnchor),
            lineViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setConstraintsToMapsHeaderLabel() {
        NSLayoutConstraint.activate([
            mapsHeaderLabel.topAnchor.constraint(equalTo: lineViewTwo.bottomAnchor, constant: 24),
            mapsHeaderLabel.leadingAnchor.constraint(equalTo: lineViewTwo.leadingAnchor),
            mapsHeaderLabel.widthAnchor.constraint(equalTo: lineViewTwo.widthAnchor),
            mapsHeaderLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
        ])
    }
    
    func setConstraintsToMapsStackView() {
        NSLayoutConstraint.activate([
            mapsStackView.topAnchor.constraint(equalTo: mapsHeaderLabel.bottomAnchor, constant: 15),
            mapsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 94),
            mapsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -94),
            mapsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            mapsStackView.widthAnchor.constraint(equalToConstant: 187),
            mapsStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
