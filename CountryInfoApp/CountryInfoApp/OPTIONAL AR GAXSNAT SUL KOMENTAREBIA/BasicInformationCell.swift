//
//  BasicInformationCell.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 21.04.24.
//

//import UIKit
//
//class BasicInformationCell: UITableViewCell {
//    static let identifier = "BasicInformationCell"
//    
//    //MARK: UI Components
//    var generalLabel = UILabel()
//    var countriesLabel = UILabel()
//    
//    //MARK: Initialization
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: Methods-
//    func configure(generalLabel: String?, countriesLabel: [String]?) {
//        var tempString = ""
//        self.generalLabel.text = generalLabel
//        for string in countriesLabel! {
//            if string != countriesLabel?.last {
//                tempString += string
//                tempString += ","
//            } else {
//                tempString += string
//                tempString += "."
//            }
//        }
//        self.countriesLabel.text = tempString
//    }
////    
//    //MARK: Setup UI-
//    private func setupUI() {
//        setGeneralLabel()
//        setCountriesLabel()
//    }
//    
//    //MARK: Set UI Components-
//    func setGeneralLabel() {
//        addSubview(generalLabel)
//        generalLabel.translatesAutoresizingMaskIntoConstraints = false
//        setConstraintsToGeneralLabel()
//        generalLabel.textAlignment = .left
//        generalLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        generalLabel.textColor = .black
//        generalLabel.numberOfLines = 0
//    }
//    
//    func setCountriesLabel() {
//        addSubview(countriesLabel)
//        countriesLabel.translatesAutoresizingMaskIntoConstraints = false
//        setConstraintsToCountriesLabel()
//        countriesLabel.textAlignment = .right
//        countriesLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//        countriesLabel.textColor = .black
//        generalLabel.numberOfLines = 0
//    }
//    
//    //MARK: Set Constraints To Countries Label-
//    func setConstraintsToGeneralLabel() {
//        NSLayoutConstraint.activate([
//            generalLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            generalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            generalLabel.heightAnchor.constraint(equalToConstant: 20),
//        ])
//    }
//    
//    func setConstraintsToCountriesLabel() {
//        NSLayoutConstraint.activate([
//            countriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            countriesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            countriesLabel.heightAnchor.constraint(equalToConstant: 20),
//        ])
//    }
//}
