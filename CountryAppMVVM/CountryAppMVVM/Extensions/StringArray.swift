//
//  StringArray.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

extension [String] {
    func seperateStringWithCommon() -> String {
        var tempString: String = ""
        for string in self {
            if string != self.last {
                tempString += string
                tempString += ","
            } else {
                tempString += string
                tempString += "."
            }
        }
        return tempString
    }
}
