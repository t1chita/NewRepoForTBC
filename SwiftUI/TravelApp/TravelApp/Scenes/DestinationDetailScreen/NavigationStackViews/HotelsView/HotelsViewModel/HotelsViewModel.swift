//
//  HotelsViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class HotelsViewModel: ObservableObject {
    //MARK: pirveli API
    //MARK: meore API
    private var apiForHotelsInfo = "https://travelappthird.free.beeceptor.com/getHotelsInfo"
    @Published var hotelsArray: [Hotel] = []
    
    init() {
        fetchData()
    }
    
        func fetchData() {
            NetworkService.networkService.getData(urlString: apiForHotelsInfo) { [weak self] (result: Result< HotelsResponse,Error >) in
                switch result {
                case .success(let hotels):
                    self?.hotelsArray = hotels.hotels
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
}
