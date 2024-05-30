//
//  MustSeeViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation
class MustSeeViewModel: ObservableObject {
    //MARK: თუ ერთი api არ მუშაობს ჩააფეისთეთ მეორე რა
    //მეორე  private var apiForMustSeeInfo = "https://travelapp.free.beeceptor.com/getMustSeesInfo"
    //პირველი
    private var apiForMustSeeInfo = "https://travelappfourth.free.beeceptor.com/getMustSeesInfo"
    
    @Published var mustSees: [MustSee] = []
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForMustSeeInfo) { [weak self] (result: Result< MustSeesResponse,Error >) in
            DispatchQueue.main.async {
                switch result {
                case .success(let mustSees):
                    self?.mustSees = mustSees.mustSee
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
