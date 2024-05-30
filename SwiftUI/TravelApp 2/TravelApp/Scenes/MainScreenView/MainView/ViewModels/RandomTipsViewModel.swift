//
//  RandomTipsViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class RandomTipsViewModel: ObservableObject {
    //MARK: თუ ერთი api არ მუშაობს ჩააფეისთეთ მეორე რა
    //მეორე  private var apiForRandomTips = "https://travelapp.free.beeceptor.com/getRandomTips"
    //პირველი
    private var apiForRandomTips: String = "https://travelappfourth.free.beeceptor.com/getRandomTips"
    @Published var tipsArray: [Tips] = []
    var tip: String? = ""
    
        init() {
            fetchData()
        }
    
    func getRandomTip() {
        let randomTip = tipsArray.randomElement()
        tip = randomTip?.travelTip
    }
    
    private func fetchData() {
        NetworkService.networkService.getData(urlString: apiForRandomTips) { [weak self] (result: Result<RandomTipsResponse,Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let randomTips):
                    self?.tipsArray = randomTips.tips
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

