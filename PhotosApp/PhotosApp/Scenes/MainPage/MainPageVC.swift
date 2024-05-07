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
    //MARK: - Initialization
    init(mainPageView: MainPageView) {
        self.mainPageView = mainPageView
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
        view = mainPageView
    }
    
    //MARK: View Delegates Methods
    func getViewDelegates() {
        mainPageView.galleryCollectionView.delegate = self
        mainPageView.galleryCollectionView.dataSource = self
    }
}
