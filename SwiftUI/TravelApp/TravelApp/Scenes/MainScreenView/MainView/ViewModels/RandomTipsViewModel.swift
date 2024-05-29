//
//  RandomTipsViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation
#warning ("ამოაკომენტარე ფეჩინგი")
class RandomTipsViewModel: ObservableObject{
    private var apiForRandomTips: String = "https://travelappsecond.free.beeceptor.com/getRandomTips"
//MARK: Meore API    private var apiForRandomTips: String = "https://travelappsecond.free.beeceptor.com/RandomTravelTip"
    @Published var tipsArray: [Tips] = []
    var tip: String? = ""
    
    init() {
//        fetchData()
    }
    
    func getRandomTip() {
        let randomTip = tipsArray.randomElement()
        tip = randomTip?.travelTip
    }
    
//    private func fetchData() {
//        NetworkService.networkService.getData(urlString: apiForRandomTips) { [weak self] (result: Result<RandomTipsResponse,Error>) in
//            switch result {
//            case .success(let randomTips):
//                self?.tipsArray = randomTips.tips
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
}

