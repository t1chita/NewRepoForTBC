//
//  MainPageViewModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class MainPageViewModel {
    
    private var mainPageModel: MainPageModel
    
    var countriesArray: [Country] {
        return mainPageModel.countriesArray
    }
    
    var stackViews: [CustomStackView] {
        get {
            return mainPageModel.stackViews
        }
        set {
            mainPageModel.stackViews = newValue
        }
    }

    init(mainPageModel: MainPageModel) {
        self.mainPageModel = mainPageModel
    }
    
    func fetchData(for tableView: UITableView) {
        NetworkService().getInfo(urlString: mainPageModel.countryInfoUrl) { [weak self] (result: Result<[Country],Error>) in
            switch result {
            case .success(let success):
                self?.mainPageModel.countriesArray = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            tableView.reloadData()
        }
    }
}
