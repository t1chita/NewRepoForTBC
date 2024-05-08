//
//  FullScreenVC.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

class FullScreenVC: UIViewController {
    //MARK: - Properties
    let fullScreenView: FullScreenView
    //MARK: - Initialization
    init(fullScreenView: FullScreenView) {
        self.fullScreenView = fullScreenView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view = fullScreenView
    }
}

