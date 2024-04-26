//
//  MainPageViewModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class MainPageViewModel {
    
    private var mainPageModel: MainPageModel
    
    weak var delegate: MainPageViewControllerDelegate?
    
    var countriesArray: [Country] {
        return mainPageModel.countriesArray
    }
    
    var filteredCountries: [Country] = []
    
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
    
    func setup() {
        fetchData()
    }
    
   private func fetchData() {
        NetworkService().getInfo(urlString: mainPageModel.countryInfoUrl) { [weak self] (result: Result<[Country],Error>) in
            switch result {
            case .success(let success):
                self?.mainPageModel.countriesArray = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            self?.delegate?.reloadData()
        }
    }
}

//MARK: SearchController Methods
extension MainPageViewModel {
    
    func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
    }
    
    func updateSearchResults(for searchText: String?) {
        
        guard let searchText = searchText?.lowercased(), !searchText.isEmpty else {
            self.filteredCountries = countriesArray
            return
        }
        
        filteredCountries = countriesArray.filter { country in
            if let commonName = country.name?.common?.lowercased() {
                return commonName.contains(searchText)
            }
            return false
        }
    }
}
