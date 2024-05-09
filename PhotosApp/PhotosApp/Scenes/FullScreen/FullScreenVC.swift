//
//  FullScreenVC.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class FullScreenVC: UIViewController {
    enum Section {
        case main
    }
    
    //MARK: - Properties
    let fullScreenView: FullScreenView
    let fullScreenViewModel: FullScreenViewModel
    
    //MARK: - Initialization
    init(fullScreenView: FullScreenView, fullScreenViewModel: FullScreenViewModel) {
        self.fullScreenView = fullScreenView
        self.fullScreenViewModel = fullScreenViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()   
        getViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view = fullScreenView
    }
    
    //MARK: DataSource & DataSourceSnapshot typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Section,ImageModel>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section,ImageModel>
    
    var dataSource: DataSource!
    var snapshot = DataSourceSnapshot()
    
    //MARK: Methods
    func getViewDelegates() {
        fullScreenView.imagesCollectionView.delegate = self
    }
    
    func loadImage() {
        let indexPath = IndexPath(row: fullScreenViewModel.imageIndex, section: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.fullScreenView.imagesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            self?.fullScreenView.imagesCollectionView.isPagingEnabled = true
        }
    }
}

