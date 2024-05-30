//
//  TransportViewModel.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import Foundation

class TransportViewModel: ObservableObject {
    //MARK: თუ ერთი api არ მუშაობს ჩააფეისთეთ მეორე რა
    //მეორე  private var apiForMustSeeInfo = "https://travelapp.free.beeceptor.com/getTransportInfo""
    //პირველი
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

