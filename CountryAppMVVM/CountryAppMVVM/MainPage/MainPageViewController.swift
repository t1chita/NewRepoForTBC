//
//  MainPageViewController.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

protocol MainPageViewControllerDelegate: AnyObject {
    func reloadData()
}

class MainPageViewController: UIViewController {
    //MARK: UI Components-
     let searchController = UISearchController(searchResultsController: nil)
    //MARK: Properties-
    var mainPageView: MainPageView
    var mainPageViewModel: MainPageViewModel
    
    //MARK: Initialization-
    init() {
        self.mainPageView = MainPageView()
        mainPageViewModel = MainPageViewModel(mainPageModel: MainPageModel())
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycles-
    override func loadView() {
        view = mainPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        tableViewProtocols()
        setupData()
        updateTrait()
        setupSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: TableViewProtocolos
    func tableViewProtocols() {
        mainPageView.countriesTableView.delegate = self
        mainPageView.countriesTableView.dataSource = self
        mainPageViewModel.delegate = self
    }
    
    //MARK: setup Navigation SearchController
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search Country"
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK: setupData-
    func setupData() {
        mainPageViewModel.setup()
    }
    
    //MARK: updateTheme
    func updateTrait() {
            registerForTraitChanges([UITraitUserInterfaceStyle.self], handler: { (self: Self, previousTraitCollection: UITraitCollection) in
                if self.traitCollection.userInterfaceStyle == .light {
                    self.mainPageView.countriesTableView.reloadData()
                } else {
                    self.mainPageView.countriesTableView.reloadData()
                }
            })
        }
}


//MARK: MainPageViewControllerDelegate-
extension MainPageViewController: MainPageViewControllerDelegate {
    func reloadData() {
        mainPageView.countriesTableView.reloadData()
    }
}

//MARK: Search Controller Functions-
extension MainPageViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        mainPageViewModel.updateSearchResults(for: searchController.searchBar.text)
        mainPageView.countriesTableView.reloadData()
    }
}
