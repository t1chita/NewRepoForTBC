//
//  MainPageVC.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 22.04.24.
//

import UIKit

extension MainPageVC {
    func configureDetails(countriesArray: [Country], index: Int) {
        nameStackView.countryLabel.text = countriesArray[index].name?.common
        tldStackView.countryLabel.text = countriesArray[index].tld?.seperateStringWithCommon()
        statusStackView.countryLabel.text = countriesArray[index].status
        currenciesStackView.countryLabel.text = "Name: \(countriesArray[index].currencies?.first?.value.name ?? "ვი დონთ ჰევ"),  " + "        Symbol: \(countriesArray[index].currencies?.first?.value.symbol ?? "ვი დონთ ჰევ")"
        capitalStackView.countryLabel.text = countriesArray[index].capital?.seperateStringWithCommon()
        altSpellingsStackView.countryLabel.text = countriesArray[index].altSpellings?.seperateStringWithCommon()
        regionStackView.countryLabel.text = countriesArray[index].region
        subregionStackView.countryLabel.text = countriesArray[index].subregion
        languagesStackView.countryLabel.text = countriesArray[index].languages?.getArrayFromDictionary().seperateStringWithCommon()
        latlngStackView.countryLabel.text = countriesArray[index].latlng?.getStringsFromDoubles()
        bordersStackView.countryLabel.text = countriesArray[index].borders?.seperateStringWithCommon() ?? "ვი დონთ ჰევ"
        areaStackView.countryLabel.text = String(countriesArray[index].area ?? 0)
        demonymsStackView.countryLabel.text = "\(countriesArray[index].demonyms?.fra?.f ?? "ვი დონთ ჰევ")," + " \(countriesArray[index].demonyms?.fra?.m ?? "ვი დონთ ჰევ")"
        flagStackView.countryLabel.text = countriesArray[index].flag
        populationStackView.countryLabel.text = String(countriesArray[index].population ?? 0)
        carStackView.countryLabel.text = "Side: \(countriesArray[index].car?.side ?? "ვი დონთ ჰევ"),  " + "        Sign: \(countriesArray[index].car?.signs?.first ?? "ვი დონთ ჰევ")"
        timezonesStackView.countryLabel.text = countriesArray[index].timezones?.seperateStringWithCommon()
        continentsStackView.countryLabel.text = countriesArray[index].continents?.seperateStringWithCommon()
        startOfWeekStackView.countryLabel.text = countriesArray[index].startOfWeek
        capitalInfoStackView.countryLabel.text = countriesArray[index].capitalInfo?.latlng?.getStringsFromDoubles()
        postalCodeStackView.countryLabel.text = "Format: \(countriesArray[index].postalCode?.format ?? "ვი დონთ ჰევ"),  " + "        Regex: \(countriesArray[index].postalCode?.regex ?? "ვი დონთ ჰევ")"
    }
}
