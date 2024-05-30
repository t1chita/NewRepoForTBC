//
//  HotelsViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class HotelsViewModel: ObservableObject {
    //MARK: თუ ერთი api არ მუშაობს ჩააფეისთეთ მეორე რა
    //მეორე  private var apiForHotelsInfo = "https://travelapp.free.beeceptor.com/getHotelsInfo"
    //პირველი
    private let apiForHotelsInfo = "https://travelappfourth.free.beeceptor.com/getHotelsInfo"
    
    
    
    @Published var hotelsArray: [HotelCategory] = []
    @Published var errorMessage: String?
    
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForHotelsInfo) { [weak self] (result: Result<HotelData, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let hotels):
                    self?.hotelsArray = hotels.hotels
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
