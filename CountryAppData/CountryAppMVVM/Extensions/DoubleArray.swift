//
//  DoubleArray.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

extension [Double] {
    func getStringsFromDoubles() -> String {
        var tempString: String = ""
        for double in self {
            let tempDoubleString = String(double)
            if double != self.last {
                tempString += tempDoubleString
                tempString += ","
            } else {
                tempString += tempDoubleString
                tempString += "."
            }
        }
        return tempString
    }
}
