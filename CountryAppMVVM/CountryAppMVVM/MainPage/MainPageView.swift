//
//  MainPageView.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class MainPageView: UIView {
    
    let countriesTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        setCountriesTableView()
        backgroundColor = .systemBackground
    }
    
    //MARK: Set Ui Components-
    private func setCountriesTableView() {
        addSubview(countriesTableView)
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountriesTableView()
        countriesTableView.separatorStyle = .none
        countriesTableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
    }

    //MARK: Set Constraints To UI Components-
    private func setConstraintsToCountriesTableView() {
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            countriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            countriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            countriesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
