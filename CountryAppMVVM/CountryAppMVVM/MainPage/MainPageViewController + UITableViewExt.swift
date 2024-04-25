//
//  MainPageViewController + UITableViewExt.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//
import UIKit

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryDetailsPageController = CountryDetailsPageViewController()
        countryDetailsPageController.countryDetailsPageViewModel.countriesName = mainPageViewModel.countriesArray[indexPath.section].name?.common ?? "არ ალი"
        countryDetailsPageController.countryDetailsPageViewModel.countriesFlag =  mainPageViewModel.countriesArray[indexPath.section].flags?.png ?? "არ ალი"
        countryDetailsPageController.countryDetailsPageViewModel.aboutTheFlagDescription = mainPageViewModel.countriesArray[indexPath.section].flags?.alt ?? "არ ალი"
    
        mainPageViewModel.stackViews = countryDetailsPageController.countryDetailsPageViewModel.stackViewsViewModel
        
        configureDetails(countriesArray: mainPageViewModel.countriesArray, index: indexPath.section)

        countryDetailsPageController.countryDetailsPageView.iosMapButton.addAction(UIAction(title: "Go To OpenStreet Map", handler: { [weak self] _ in
            if let urlOfIosMap = URL(string: self?.mainPageViewModel.countriesArray[indexPath.section].maps?.openStreetMaps ?? "") {
                UIApplication.shared.open(urlOfIosMap)
            }
        }), for: .touchUpInside)
        countryDetailsPageController.countryDetailsPageView.googleMapButton.addAction(UIAction(title: "Go To Google Map", handler: { [weak self] _ in
            if let urlOfGoogleMap = URL(string: self?.mainPageViewModel.countriesArray[indexPath.section].maps?.googleMaps ?? "") {
                UIApplication.shared.open(urlOfGoogleMap)
            }
        }), for: .touchUpInside)
        
        navigationController?.pushViewController(countryDetailsPageController, animated: true)
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        mainPageViewModel.countriesArray.count
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
        let cell = mainPageView.countriesTableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell
        cell?.configure(countryFlagUrl: mainPageViewModel.countriesArray[indexPath.section].flags?.png , countryName:  mainPageViewModel.countriesArray[indexPath.section].name?.common)
        return cell ?? UITableViewCell()
    }
}

extension MainPageViewController {
    func configureDetails(countriesArray: [Country], index: Int) {
        mainPageViewModel.stackViews[0].countryLabel.text = countriesArray[index].name?.common
        mainPageViewModel.stackViews[1].countryLabel.text = countriesArray[index].tld?.seperateStringWithCommon()
        mainPageViewModel.stackViews[2].countryLabel.text = countriesArray[index].status
        mainPageViewModel.stackViews[3].countryLabel.text = "Name: \(countriesArray[index].currencies?.first?.value.name ?? "ვი დონთ ჰევ"),  " + "        Symbol: \(countriesArray[index].currencies?.first?.value.symbol ?? "ვი დონთ ჰევ")"
        mainPageViewModel.stackViews[4].countryLabel.text = countriesArray[index].capital?.seperateStringWithCommon()
        mainPageViewModel.stackViews[5].countryLabel.text = countriesArray[index].altSpellings?.seperateStringWithCommon()
        mainPageViewModel.stackViews[6].countryLabel.text = countriesArray[index].region
        mainPageViewModel.stackViews[7].countryLabel.text = countriesArray[index].subregion
        mainPageViewModel.stackViews[8].countryLabel.text = countriesArray[index].languages?.getArrayFromDictionary().seperateStringWithCommon()
        mainPageViewModel.stackViews[9].countryLabel.text = countriesArray[index].latlng?.getStringsFromDoubles()
        mainPageViewModel.stackViews[10].countryLabel.text = countriesArray[index].borders?.seperateStringWithCommon() ?? "ვი დონთ ჰევ"
        mainPageViewModel.stackViews[11].countryLabel.text = String(countriesArray[index].area ?? 0)
        mainPageViewModel.stackViews[12].countryLabel.text = "\(countriesArray[index].demonyms?.fra?.f ?? "ვი დონთ ჰევ")," + " \(countriesArray[index].demonyms?.fra?.m ?? "ვი დონთ ჰევ")"
        mainPageViewModel.stackViews[13].countryLabel.text = countriesArray[index].flag
        mainPageViewModel.stackViews[14].countryLabel.text = String(countriesArray[index].population ?? 0)
        mainPageViewModel.stackViews[15].countryLabel.text = "Side: \(countriesArray[index].car?.side ?? "ვი დონთ ჰევ"),  " + "        Sign: \(countriesArray[index].car?.signs?.first ?? "ვი დონთ ჰევ")"
        mainPageViewModel.stackViews[16].countryLabel.text = countriesArray[index].timezones?.seperateStringWithCommon()
        mainPageViewModel.stackViews[17].countryLabel.text = countriesArray[index].continents?.seperateStringWithCommon()
        mainPageViewModel.stackViews[18].countryLabel.text = countriesArray[index].startOfWeek
        mainPageViewModel.stackViews[19].countryLabel.text = countriesArray[index].capitalInfo?.latlng?.getStringsFromDoubles()
        mainPageViewModel.stackViews[20].countryLabel.text = "Format: \(countriesArray[index].postalCode?.format ?? "ვი დონთ ჰევ"),  " + "        Regex: \(countriesArray[index].postalCode?.regex ?? "ვი დონთ ჰევ")"
    }
}
