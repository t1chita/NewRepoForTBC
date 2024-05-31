//
//  EpisodesDetailsPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import Foundation


class EpisodesDetailsPageViewModel: ObservableObject {
    private var episode: Episode
    @Published var characters: [CartoonCharacter] = []
    
    init(episode: Episode) {
        self.episode = episode
    }
    
    func fetchChars(episode: Episode) {
        for index in episode.characters.indices {
            NetworkService.networkService.getData(urlString: episode.characters[index] ) { [weak self] (result: Result<CartoonCharacter, Error>) in
                switch result {
                case .success(let character):
                    self?.characters.append(character)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
