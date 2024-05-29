//
//  TransportViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation
#warning ("ამოაკომენტარე ფეჩინგი")
class TransportViewModel: ObservableObject {
    //MARK: pirveli API private var apiForTransportInfo =
    //MARK: meore API private var apiForTransportInfo =
    //    private var apiForTransportInfo = "https://travelappthird.free.beeceptor.com/getTransportInfo"
    private var apiForTransportInfo = "https://travelappfourth.free.beeceptor.com/getTransportInfo"
    @Published var transports: [Transport] = []
    
    func fetchData() {
        NetworkService.networkService.getData(urlString: apiForTransportInfo) { [weak self] (result: Result< TransportsResponse,Error >) in
            DispatchQueue.main.async {
                switch result {
                case .success(let transports):
                    self?.transports = transports.transport
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

