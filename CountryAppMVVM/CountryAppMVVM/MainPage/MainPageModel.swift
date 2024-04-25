//
//  MainPageModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class MainPageModel {
    var countriesArray: [Country] = []
    var countryInfoUrl = "https://restcountries.com/v3.1/all#"
    var stackViews: [CustomStackView] = []
}
