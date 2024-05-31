//
//  SearchPageViewModel.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI


enum SlideOfCategory: String, CaseIterable {
    case episodes = "Episodes"
    case characters = "Characters"
}

class SearchPageViewModel: ObservableObject {
    var episodesViewModel: EpisodesPageViewModel
    var charactersViewModel: CharactersPageViewModel
    @Published var selectedSlide: SlideOfCategory = .episodes
    @Published var searchTerm = ""
    
    init(episodesViewModel: EpisodesPageViewModel, charactersViewModel: CharactersPageViewModel) {
        self.episodesViewModel = episodesViewModel
        self.charactersViewModel = charactersViewModel
    }
    
    private var filteredEpisodes: [Episodes] {
        return episodesViewModel.episodes.filter({$0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    private var filteredCharacters: [CartoonCharacter] {
        return charactersViewModel.characters.filter({$0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    var filteredItems: [Displayable] {
        switch selectedSlide {
        case .episodes:
            return filteredEpisodes
        case .characters:
            return filteredCharacters
        }
    }
}
