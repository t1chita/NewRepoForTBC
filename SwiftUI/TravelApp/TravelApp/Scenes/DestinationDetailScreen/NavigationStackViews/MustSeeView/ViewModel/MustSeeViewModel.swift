//
//  MustSeeViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class MustSeeViewModel: ObservableObject {
    //MARK: pirveli API
    //MARK: meore API
    private var apiForMustSeeInfo = "https://travelappthird.free.beeceptor.com/getMustSeesInfo"
    @Published var mustSees: [MustSee] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForMustSeeInfo) { [weak self] (result: Result< MustSeesResponse,Error >) in
            switch result {
            case .success(let mustSees):
                self?.mustSees = mustSees.mustSee
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
