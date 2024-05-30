//
//  CharacterDetailsPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//
//
import Foundation

class CharacterDetailsPageViewModel: ObservableObject {
    private var character: CartoonCharacter
    
    @Published var episodes: [EpisodesResponse] = []
    
    init(character: CartoonCharacter) {
        self.character = character
        fetchData()
    }
    
    private func fetchData() {
        for index in character.episode.indices {
            NetworkService.networkService.getData(urlString: character.episode[index]) { [weak self] (result: Result<EpisodesResponse, Error>) in
                switch result {
                case .success(let episode):
                    self?.episodes.append(episode)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
