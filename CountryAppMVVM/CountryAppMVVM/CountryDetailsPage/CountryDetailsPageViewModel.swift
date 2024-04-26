//
//  CountryPageModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit


class CountryDetailsPageViewModel {
    var name: String?
    var flagDescription: String?
    var flag: String?
    let aboutTheFlagTitle = "About the Flag:"
    let basicInformationLabel = "Basic Information:"
    let mapsHeaderLabel = "Useful Links:"
    
    var stackViews: [CustomStackView] = [
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView(),
        CustomStackView()
    ]
    
    var generalLabelsTexts: [String] = ["Name:",
                                        "Tld:",
                                        "Status:",
                                        "Currencies:",
                                        "Capital:",
                                        "AltSpellings:",
                                        "Region:",
                                        "Subregion:",
                                        "Languages:",
                                        "Latlng:",
                                        "Borders:",
                                        "Area:",
                                        "Demonyms:",
                                        "Flag:",
                                        "Population:",
                                        "Car:",
                                        "Timezones:",
                                        "Continents:",
                                        "StartOfWeek:",
                                        "CapitalInfo:",
                                        "PostalCode:"
    ]
    
    init(country: Country) {
        stackViews[0].countryLabel.text = country.name?.common
        stackViews[1].countryLabel.text = country.tld?.seperateStringWithCommon()
        stackViews[2].countryLabel.text = country.status
        stackViews[3].countryLabel.text = "Name: \(country.currencies?.first?.value.name ?? "ვი დონთ ჰევ"),  " + "        Symbol: \(country.currencies?.first?.value.symbol ?? "ვი დონთ ჰევ")"
        stackViews[4].countryLabel.text = country.capital?.seperateStringWithCommon()
        stackViews[5].countryLabel.text = country.altSpellings?.seperateStringWithCommon()
        stackViews[6].countryLabel.text = country.region
        stackViews[7].countryLabel.text = country.subregion
        stackViews[8].countryLabel.text = country.languages?.getArrayFromDictionary().seperateStringWithCommon()
        stackViews[9].countryLabel.text = country.latlng?.getStringsFromDoubles()
        stackViews[10].countryLabel.text = country.borders?.seperateStringWithCommon() ?? "ვი დონთ ჰევ"
        stackViews[11].countryLabel.text = String(country.area ?? 0)
        stackViews[12].countryLabel.text =  "\(country.demonyms?.fra?.f ?? "ვი დონთ ჰევ")," + " \(country.demonyms?.fra?.m ?? "ვი დონთ ჰევ")"
        stackViews[13].countryLabel.text = country.flag
        stackViews[14].countryLabel.text = String(country.population ?? 0)
        stackViews[15].countryLabel.text = "Side: \(country.car?.side ?? "ვი დონთ ჰევ"),  " + "        Sign: \(country.car?.signs?.first ?? "ვი დონთ ჰევ")"
        stackViews[16].countryLabel.text = country.timezones?.seperateStringWithCommon()
        stackViews[17].countryLabel.text = country.continents?.seperateStringWithCommon()
        stackViews[18].countryLabel.text = country.startOfWeek
        stackViews[19].countryLabel.text = country.capitalInfo?.latlng?.getStringsFromDoubles()
        stackViews[20].countryLabel.text = "Format: \(country.postalCode?.format ?? "ვი დონთ ჰევ"),  " + "        Regex: \(country.postalCode?.regex ?? "ვი დონთ ჰევ")"
    }
}
