//
//  PersonsCell.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 12.04.24.
//

import UIKit

class PersonsCell: UITableViewCell {
   //MARK: UIComponents-
    var personName = UILabel()
    var symbol     = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(personName)
        addSubview(symbol)
        
        configurePersonName()
        configureSymbol()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(nameAndLastName: String) {
        let firstnameUppercased = nameAndLastName.firstUppercased
        let uppercasedFullName  = firstnameUppercased.uppercaseLastName(string: firstnameUppercased)
        personName.text         = uppercasedFullName
    }
    
    
    //MARK: ConfigurationOfViews-
    func configurePersonName() {
        setConstraintsToPersonName()
        personName.font      = UIFont.systemFont(ofSize: 17, weight: .regular)
        personName.textColor = .title
    }
    
    
    func configureSymbol() {
        setConstraintsToSymbol()
        symbol.setImage(.detailsSymbol, for: .normal)
    }

    
    //MARK: SetConstraints-
    func setConstraintsToSymbol() {
        symbol.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            symbol.topAnchor.constraint(equalTo: topAnchor, constant: 15.85),
            symbol.leadingAnchor.constraint(equalTo: personName.trailingAnchor, constant: 135),
            symbol.widthAnchor.constraint(equalToConstant: 7),
        ])
    }
    
    
    func setConstraintsToPersonName() {
        personName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personName.centerYAnchor.constraint(equalTo: centerYAnchor),
            personName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -175),
            personName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        ])
    }
}


//MARK: ExtensionsForString
extension String {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    
    func uppercaseLastName(string: String) -> String {
        
        var arrForString: [Character] = []
        var indexForArray = 0
        var stringForReturn = ""
        
        for char in string {
            arrForString.append(char)
        }
        for _ in 0..<arrForString.count - 1 {
            if arrForString[indexForArray] == " " {
                let uppercasedChar = arrForString[indexForArray + 1].uppercased()
                arrForString.remove(at: indexForArray + 1)
                arrForString.insert(contentsOf: uppercasedChar, at: indexForArray + 1)
                break
            }
            indexForArray += 1
        }
        for char in arrForString {
            stringForReturn.append(char)
        }
        return stringForReturn
    }
}
