//
//  MainPageVC.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: - Properties
    let mainPageView: MainPageView
    let mainPageViewModel: MainPageViewModel
    //MARK: - Initialization
    init(mainPageView: MainPageView, mainPageViewModel: MainPageViewModel) {
        self.mainPageView = mainPageView
        self.mainPageViewModel = mainPageViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: DataSource & DataSourceSnapshot typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Section,ImageModel>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section,ImageModel>
    
    var dataSource: DataSource!
    var snapshot = DataSourceSnapshot()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        getViewDelegates()
        mainPageViewModel.didLoad()
        configureCollectionViewDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view = mainPageView
    }
    
    //MARK: View Delegates Methods
    func getViewDelegates() {
        mainPageView.galleryCollectionView.delegate = self
        mainPageViewModel.delegate = self
    }
}
