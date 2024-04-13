//
//  OwnersTableViewHeader.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 12.04.24.
//

import UIKit

class OwnersTableViewHeader: UIView {
    //MARK: UIComponents-
    let ownersImage     = UIImageView()
    let ownersFullName  = UILabel()
    let detailsSymbol   = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ownersImage)
        addSubview(ownersFullName)
        addSubview(detailsSymbol)
        
        configurationOwnersImage()
        configurationPersonsFullName()
        configurationdetailsSymbol()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: ConfigurationOfViews-
    func configurationOwnersImage() {
        setConstraintsToOwnersImage()
        ownersImage.image              = .hajiGiorgi
        ownersImage.contentMode        = .scaleAspectFit
        ownersImage.layer.cornerRadius = 30
        ownersImage.clipsToBounds      = true
    }
    
    
    func configurationPersonsFullName() {
        setConstraintsToOwnersFullName()
        ownersFullName.text = "temur chitashvili"
        let firstnameUppercased  =  ownersFullName.text?.firstUppercased
        let uppercasedFullName   = firstnameUppercased?.uppercaseLastName(string: firstnameUppercased ?? "")
        ownersFullName.text      = uppercasedFullName
        ownersFullName.textColor = .title
        ownersFullName.font      = UIFont.systemFont(ofSize: 22, weight: .regular)
    }
    
    
    func configurationdetailsSymbol() {
        setConstraintsToDetailsSymbol()
        detailsSymbol.setImage(.detailsSymbol, for: .normal)
    }
    
    
    //MARK: SetConstraints-
    func setConstraintsToOwnersImage() {
        ownersImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ownersImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            ownersImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            ownersImage.heightAnchor.constraint(equalToConstant: 60),
            ownersImage.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    func setConstraintsToOwnersFullName() {
        ownersFullName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ownersFullName.centerYAnchor.constraint(equalTo: centerYAnchor),
            ownersFullName.leadingAnchor.constraint(equalTo: ownersImage.trailingAnchor, constant: 16),
            ownersFullName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56)
        ])
    }
    
    
    func setConstraintsToDetailsSymbol() {
        detailsSymbol.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailsSymbol.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailsSymbol.leadingAnchor.constraint(equalTo: ownersFullName.trailingAnchor, constant: 17),
            detailsSymbol.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }
}
