//
//  MainPageVC.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 01.05.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: - Properties
    let mainPageView: MainPageView
    let mainPageViewModel: MainPageViewModel
    
    //MARK: - Initialization
    init(mainPageViewModel: MainPageViewModel, mainPageView: MainPageView) {
        self.mainPageViewModel = mainPageViewModel
        self.mainPageView = mainPageView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view = mainPageView
        title = "Cats App"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageViewModel.didLoad()
        reloadData()
        getTableViewExtensions()
        
    }
    
    //MARK: - Helper Methods
    private func getTableViewExtensions() {
        mainPageView.catsInfoTableView.delegate = self
        mainPageView.catsInfoTableView.dataSource = self
    }
    
    private func reloadData() {
        mainPageViewModel.countryUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.mainPageView.catsInfoTableView.reloadData()
            }
        }
    }
}
