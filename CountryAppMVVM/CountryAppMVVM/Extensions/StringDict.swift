//
//  StringDict.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

extension [String: String] {
    func getArrayFromDictionary() -> [String] {
        var arrForReturn: [String] = []
        for (_,value) in self {
            arrForReturn.append(value)
        }
        return arrForReturn
    }
}

