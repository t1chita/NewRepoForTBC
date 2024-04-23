//
//  CountryCell.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 20.04.24.
//

import UIKit

class CountryCell: UITableViewCell {
    static let identifier = "CountryCell"
    
    //MARK: UI Components-
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
    
    //MARK: Methods-
    func configure(countryFlagUrl: String?, countryName: String?) {
        if let imageUrl = URL(string: countryFlagUrl ?? "") {
            countryFlag.loadImage(from: imageUrl)
        }
        self.countryName.text = countryName
    }
    
    //MARK: Setup UI-
    private func setupUI() {
        setCountryFlag()
        setCountryName()
        setChevronSymbol()
        backgroundColor = .white
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 25
    }
   
    //MARK: Set UI Components-
    private func setCountryFlag() {
        addSubview(countryFlag)
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountryFlag()
        countryFlag.clipsToBounds = true
        countryFlag.layer.cornerRadius = 3
    }
    
    private func setCountryName() {
        addSubview(countryName)
        countryName.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountryName()
        countryName.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        countryName.textAlignment = .center
        countryName.textColor = .black
    }
    
    private func setChevronSymbol() {
        addSubview(chevronSymbol)
        chevronSymbol.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToChevronSymbol()
        chevronSymbol.image = UIImage(systemName: "chevron.right")?.withTintColor(.black,renderingMode: .alwaysOriginal)
    }
    
    //MARK: Set Constraints To UI Components-
    private func setConstraintsToCountryFlag() {
        NSLayoutConstraint.activate([
            countryFlag.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryFlag.heightAnchor.constraint(equalToConstant: 20),
            countryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            countryFlag.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setConstraintsToCountryName() {
        NSLayoutConstraint.activate([
            countryName.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryName.heightAnchor.constraint(equalToConstant: 17),
            countryName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
        ])
    }
    
    private func setConstraintsToChevronSymbol() {
        NSLayoutConstraint.activate([
            chevronSymbol.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronSymbol.heightAnchor.constraint(equalToConstant: 15),
            chevronSymbol.widthAnchor.constraint(equalToConstant: 11),
            chevronSymbol.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
        ])
    }
}
