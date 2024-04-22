//
//  MainPageVC + ExtUITableView.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 20.04.24.
//

import UIKit

extension MainPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryDetailsPageVC = CountryDetailsPageVC()
        countryDetailsPageVC.countriesName.text = countriesArray[indexPath.section].name?.common
        countryDetailsPageVC.countriesFlag.loadImage(from: URL(string: countriesArray[indexPath.section].flags!.png!)!)
        countryDetailsPageVC.aboutTheFlagDescription.text = countriesArray[indexPath.section].flags?.alt
        configureDetails(countriesArray: countriesArray, index: indexPath.section)
        navigationController?.pushViewController(countryDetailsPageVC, animated: true)
    }
}

extension MainPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerInSectionView = UIView()
        headerInSectionView.backgroundColor = .clear
        return headerInSectionView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell
        cell?.configure(countryFlagUrl: countriesArray[indexPath.section].flags?.png, countryName: countriesArray[indexPath.section].name?.common)
        return cell ?? UITableViewCell()
    }
}

