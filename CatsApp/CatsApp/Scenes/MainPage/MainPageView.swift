//
//  MainPageView.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 01.05.24.
//

import UIKit

class MainPageView: UIView {
    //MARK: - UIComponents
    let catsInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup UI
    func setupUI() {
        setConstraintsToCatsInfoTableView()
    }
    
    //MARK: - Set Constrainst To UI Components
    func setConstraintsToCatsInfoTableView() {
        addSubview(catsInfoTableView)
        catsInfoTableView.register(CatCell.self, forCellReuseIdentifier: CatCell.identifier)
        NSLayoutConstraint.activate([
            catsInfoTableView.topAnchor.constraint(equalTo: topAnchor),
            catsInfoTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            catsInfoTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catsInfoTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}



