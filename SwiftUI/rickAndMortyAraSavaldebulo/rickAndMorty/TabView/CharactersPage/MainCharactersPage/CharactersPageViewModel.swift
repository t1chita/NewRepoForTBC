//
//  CharactersPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import Foundation

class CharactersPageViewModel: ObservableObject {
    private var charactersApi: String = "https://rickandmortyapi.com/api/character"
    
    @Published var characters: [CartoonCharacter] = []
    
    init() {
        fetchData()
    }
    
    
    func getCharacter(id: Int) -> CartoonCharacter {
        return characters.first(where: {$0.id == id})!
    }
    
    private func fetchData() {
        NetworkService.networkService.getData(urlString: charactersApi) { [weak self] (result: Result< CharacterResponse, Error >) in
            switch result {
            case .success(let charactersResponse):
                self?.characters = charactersResponse.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
