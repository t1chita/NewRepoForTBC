//
//  Country.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 25.04.24.
//

import UIKit

struct Country: Codable {
    let name: Name?
    let tld: [String]?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies: [String: Currency]?
    let idd: Idd?
    let capital: [String]?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let flags: Flags?
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

struct Name: Codable {
    let common: String?
    let official: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}

struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
    
}

struct Demonyms: Codable {
    let eng: Demonym?
    let fra: Demonym?
}

struct Demonym: Codable {
    let f: String?
    let m: String?
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Car: Codable {
    let signs: [String]?
    let side: String?
}

struct Flags: Codable {
    let png: String?
    let alt: String?
}

struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

struct PostalCode: Codable {
    let format: String?
    let regex: String?
}
