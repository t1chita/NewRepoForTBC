//
//  HotelsViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation
#warning ("ამოაკომენტარე ფეჩინგი")

class HotelsViewModel: ObservableObject {
    //    private let apiForHotelsInfo = "https://travelappthird.free.beeceptor.com/getHotelsInfo"
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
