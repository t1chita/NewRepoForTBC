//
//  CountryPageModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit


class CountryDetailsPageModel {
    var countriesName: String = ""
    var countriesFlag: String? = ""
    var aboutTheFlagDescription: String = ""
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
}
