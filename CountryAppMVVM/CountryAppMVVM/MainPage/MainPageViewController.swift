//
//  MainPageViewController.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class MainPageViewController: UIViewController {
    var mainPageView: MainPageView
    var mainPageViewModel: MainPageViewModel

    init() {
        self.mainPageView = MainPageView()

        mainPageViewModel = MainPageViewModel(mainPageModel: MainPageModel())
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        tableViewExtensions()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func tableViewExtensions() {
        mainPageView.countriesTableView.delegate = self
        mainPageView.countriesTableView.dataSource = self
    }
    
    func fetchData() {
        mainPageViewModel.fetchData(for: mainPageView.countriesTableView)
    }
}
