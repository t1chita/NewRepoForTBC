//
//  CountryCell.swift
//  CountryInfoAppMVVM
//
//  Created by Temur Chitashvili on 24.04.24.
//

import UIKit

class CountryCell: UITableViewCell {
    static let identifier = "CountryCell"
    
    //MARK: UI Components-
    var rectangleView = UIView()
    var countryFlag = UIImageView()
    var countryName = UILabel()
    let chevronSymbol = UIImageView()
    
    //MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rectangleView.backgroundColor = .background
        rectangleView.clipsToBounds = true
        rectangleView.layer.borderWidth = 1
        rectangleView.layer.borderColor = UIColor.systemLabel.cgColor
        rectangleView.layer.cornerRadius = 30
        rectangleView.layer.masksToBounds = true
    }
    //MARK: Methods-
    func configure(country: Country) {
        if let imageUrl = URL(string: country.flags?.png ?? "") {
            countryFlag.loadImage(from: imageUrl)
        }
        self.countryName.text = country.name?.common
    }
    
    //MARK: Setup UI-
    private func setupUI() {
        setRectangleView()
        setCountryFlag()
        setCountryName()
        setChevronSymbol()
        selectionStyle = .none
    }
    
    //MARK: Set UI Components-
    private func setRectangleView() {
        addSubview(rectangleView)
        setConstraintsToRectangleView()
        rectangleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setCountryFlag() {
        rectangleView.addSubview(countryFlag)
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountryFlag()
        countryFlag.clipsToBounds = true
        countryFlag.layer.cornerRadius = 3
    }
    
    private func setCountryName() {
        rectangleView.addSubview(countryName)
        countryName.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountryName()
        countryName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        countryName.textAlignment = .center
        countryName.textColor = .systemLabel
    }
    
    private func setChevronSymbol() {
        rectangleView.addSubview(chevronSymbol)
        chevronSymbol.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToChevronSymbol()
        chevronSymbol.image = UIImage(systemName: "chevron.right")?.withTintColor(.systemLabel,renderingMode: .alwaysOriginal)
    }
    
    //MARK: Set Constraints To UI Components-
    private func setConstraintsToRectangleView() {
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rectangleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            rectangleView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func setConstraintsToCountryFlag() {
        NSLayoutConstraint.activate([
            countryFlag.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            countryFlag.heightAnchor.constraint(equalToConstant: 20),
            countryFlag.leadingAnchor.constraint(equalTo: rectangleView.leadingAnchor, constant: 24),
            countryFlag.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setConstraintsToCountryName() {
        NSLayoutConstraint.activate([
            countryName.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            countryName.heightAnchor.constraint(equalToConstant: 17),
            countryName.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -34),
        ])
    }
    
    private func setConstraintsToChevronSymbol() {
        NSLayoutConstraint.activate([
            chevronSymbol.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
            chevronSymbol.heightAnchor.constraint(equalToConstant: 15),
            chevronSymbol.widthAnchor.constraint(equalToConstant: 11),
            chevronSymbol.trailingAnchor.constraint(equalTo: rectangleView.trailingAnchor, constant: -23),
        ])
    }
}
