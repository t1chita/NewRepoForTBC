//
//  MainPageVC.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 20.04.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: UI Components-
    let pageTitle = UILabel()
    let countriesTableView = UITableView()

    //MARK: Life Cycles-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    //MARK: Setup UI-
    func setupUI() {
        setPageTitle()
        setCountriesTableView()
    }
    //MARK: Set Ui Components-
    func setPageTitle() {
        view.addSubview(pageTitle)
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToPageTitle()
        pageTitle.text = "Countries"
        pageTitle.textAlignment = .left
        pageTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        pageTitle.textColor = .black
    }
    
    func setCountriesTableView() {
        view.addSubview(countriesTableView)
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraintsToCountriesTableView()
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        countriesTableView.rowHeight = 30
        countriesTableView.backgroundColor = .green
    }

    //MARK: Set Constraints To UI Components-
    func setConstraintsToPageTitle() {
        NSLayoutConstraint.activate([
        pageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
        pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -241),
        pageTitle.heightAnchor.constraint(equalToConstant: 29)
        ])
    }
    
    func setConstraintsToCountriesTableView() {
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 14),
            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

