//
//  MainScreenViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    //MARK: თუ ერთი api არ მუშაობს ჩააფეისთეთ მეორე რა
    //მეორე  private var apiForCountriesInfo = "https://travelapp.free.beeceptor.com/getCountriesInfo"
    //პირველი
    private var apiForCountriesInfo = "https://travelappfourth.free.beeceptor.com/getCountriesInfo"
    @Published var countryInfoArray: [Slide] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForCountriesInfo) { (result: Result<GalleryResponse,Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let gallery):
                    self.countryInfoArray = gallery.gallery.slides
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

