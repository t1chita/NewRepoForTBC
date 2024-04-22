//
//  DoubleArrayEXT.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 22.04.24.
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


