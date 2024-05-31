//
//  LocationPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation

class LocationPageViewModel: ObservableObject {
    private var locationApi: String = "https://rickandmortyapi.com/api/location"
    @Published var locations: [Location] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        NetworkService.networkService.getData(urlString: locationApi) { [weak self] (result: Result< LocationResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    self?.locations = locations.results
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
