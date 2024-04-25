//
//  CountryDetailsPageViewModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

class CountryDetailsPageViewModel {
    var countryDetailsPageModel: CountryDetailsPageModel
    
    var countriesName: String {
        get {
            return countryDetailsPageModel.countriesName
        }
        set {
            countryDetailsPageModel.countriesName = newValue
        }
    }
    
    var countriesFlag: String? {
        get {
            return countryDetailsPageModel.countriesFlag
        }
        set {
            countryDetailsPageModel.countriesFlag = newValue
        }
    }
    
    var aboutTheFlagDescription: String {
        get {
            return countryDetailsPageModel.aboutTheFlagDescription
        }
        set {
            countryDetailsPageModel.aboutTheFlagDescription = newValue
        }
    }
    
    var aboutTheFlagTitle: String {
        return countryDetailsPageModel.aboutTheFlagTitle
    }
    
    var basicInformationLabel: String {
        return countryDetailsPageModel.basicInformationLabel
    }
    
    var mapsHeaderLabel: String {
        return countryDetailsPageModel.mapsHeaderLabel
    }
    
    var stackViewsViewModel: [CustomStackView] {
        return countryDetailsPageModel.stackViews
    }
    
    var generalTextsArray: [String] {
        return countryDetailsPageModel.generalLabelsTexts
    }
    
    init(countryDetailsPageModel: CountryDetailsPageModel) {
        self.countryDetailsPageModel = countryDetailsPageModel
    }
}


