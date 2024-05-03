//
//  MainPageViewModel.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 01.05.24.
//

import UIKit
import NetworkServicePackages

class MainPageViewModel {
    //    MARK: - Properties
    var catsArray: [CatData] = [] {
        didSet{ countryUpdated?() }
    }
    
    var catsArrayCount: Int {
        catsArray.count
    }
    private let catsInfoApi = "https://catfact.ninja/facts?page=2"
    
    var countryUpdated: (() -> Void)?
    
    
    //    MARK: - LifeCycles
    func didLoad() {
        getCatFacts()
    }
    
    //    MARK: - Child Method
    private func getCatFacts() {
        fetchData()
    }
    
    //    MARK: - Requests
    private func fetchData() {
        NetworkService().getData(urlString: catsInfoApi) { [weak self] (result: Result<Cat,Error>) in
            switch result {
            case .success(let cats):
                self?.catsArray = cats.data
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
