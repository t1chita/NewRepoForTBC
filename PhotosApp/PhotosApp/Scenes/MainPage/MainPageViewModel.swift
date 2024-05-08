//
//  MainPageModel.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import Foundation
import NetworkServicePackages

protocol SnapshotDelegate: AnyObject {
    func applySnapshot(with imageModel: [ImageModel])
}

class MainPageViewModel {
    //MARK: - Properties
    var imagesArray: [ImageModel] = []
    
    private let imagesApi = "https://api.unsplash.com/photos/?per_page=25&client_id=zCUjWFBBrTwa9xixF2lpAX1ZEqQd3yAxa1pr_STA-X8"
    
    weak var delegate: SnapshotDelegate?
    
    //    MARK: - LifeCycles
    func didLoad() {
        getImages()
    }
    
    //    MARK: - Child Methods
    private func getImages() {
        fetchData()
    }
    
    private func fetchData() {
        NetworkService().getData(urlString: imagesApi) { [weak self] (result: Result<[ImageModel],Error>) in
            switch result {
            case .success(let images):
                self?.imagesArray = images
                self?.delegate?.applySnapshot(with: images)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
