//
//  MainScreenViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation
#warning ("ამოაკომენტარე ფეჩინგი")

class MainScreenViewModel: ObservableObject {
    private var apiForCountriesInfo = "https://travelappthird.free.beeceptor.com/getCountriesInfo"
//MARK: meore API    private var apiForCountriesInfo = "https://travelappsecond.free.beeceptor.com/countryInfo"
//MARK: Pirveli API   private var apiForCountriesInfo = "https://travelapp.free.beeceptor.com/api/CountryDetails"
    @Published var countryInfoArray: [Slide] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForCountriesInfo) { (result: Result<GalleryResponse,Error>) in
            switch result {
            case .success(let gallery):
                self.countryInfoArray = gallery.gallery.slides
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

