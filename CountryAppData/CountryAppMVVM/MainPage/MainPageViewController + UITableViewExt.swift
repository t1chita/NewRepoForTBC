//
//  MainPageViewController + UITableViewExt.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//
import UIKit

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let insearchMode = mainPageViewModel.inSearchMode(searchController)
        let country = insearchMode ? mainPageViewModel.filteredCountries[indexPath.row] : mainPageViewModel.countriesArray[indexPath.row]
        let countryDetailsPageController = CountryDetailsPageViewController()
        let detailViewModel = CountryDetailsPageViewModel(country: country)
        countryDetailsPageController.countryDetailsPageViewModel = detailViewModel
        countryDetailsPageController.countryDetailsPageViewModel?.name = country.name?.common
        countryDetailsPageController.countryDetailsPageViewModel?.flag = country.flags?.png
        countryDetailsPageController.countryDetailsPageViewModel?.flagDescription = country.flags?.alt
        countryDetailsPageController.country = country
        navigationController?.pushViewController(countryDetailsPageController, animated: true)
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inSearchMode = mainPageViewModel.inSearchMode(searchController)
        if !inSearchMode {
            return  mainPageViewModel.countriesArray.count
        }
        else {
            return mainPageViewModel.filteredCountries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainPageView.countriesTableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell
        let inSearchMode = mainPageViewModel.inSearchMode(searchController)
        let country = inSearchMode ? mainPageViewModel.filteredCountries[indexPath.row] : mainPageViewModel.countriesArray[indexPath.row]
        cell?.configure(country: country)
        return cell ?? UITableViewCell()
    }
}



