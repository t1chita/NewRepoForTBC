//
//  EpisodesPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation


class EpisodesPageViewModel: ObservableObject {
    private var episodesApi: String = "https://rickandmortyapi.com/api/episode"
    @Published var episodes: [Episodes] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
            NetworkService.networkService.getData(urlString: episodesApi ) { [weak self] (result: Result<EpisodesResponse, Error>) in
                switch result {
                case .success(let episode):
                    self?.episodes = episode.results
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
