//
//  EpisodesPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation


class EpisodesPageViewModel: ObservableObject {
    private var episodesApi: String = "https://rickandmortyapi.com/api/episode"
    
    var favouriteEpisodesNames: [String] = []
    
    @Published var favouriteEpisodesQuantity: Int = 0
    @Published var episodes: [Episode] = []
    
    init() {
        fetchData()
    }
    
    func getEpisode(with id: Int) -> Episode {
        return episodes.first(where: {$0.id == id})!
    }
    
    func favouriteEpisode(episode: Episode) {
        favouriteEpisodesNames.append(episode.name)
        favouriteEpisodesQuantity += 1
    }
    
    func unFavouriteEpisode(episode: Episode) {
        favouriteEpisodesNames.removeAll(where: { $0 == episode.name })
        favouriteEpisodesQuantity -= 1
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
