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
    case locations = "Locations"
}

class SearchPageViewModel: ObservableObject {
    var episodesViewModel: EpisodesPageViewModel
    var charactersViewModel: CharactersPageViewModel
    var locationsViewModel: LocationPageViewModel
    @Published var selectedSlide: SlideOfCategory = .episodes
    @Published var searchTerm = ""
    
    init(episodesViewModel: EpisodesPageViewModel, charactersViewModel: CharactersPageViewModel, locationsViewModel: LocationPageViewModel) {
        self.episodesViewModel = episodesViewModel
        self.charactersViewModel = charactersViewModel
        self.locationsViewModel = locationsViewModel
    }
    
    private var filteredEpisodes: [Episode] {
        return episodesViewModel.episodes.filter({$0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    private var filteredCharacters: [CartoonCharacter] {
        return charactersViewModel.characters.filter({$0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    private var filteredLocations: [Location] {
        return locationsViewModel.locations.filter({$0.name.localizedCaseInsensitiveContains(searchTerm)})
    }
    
    var filteredItems: [Displayable] {
        switch selectedSlide {
        case .episodes:
            return filteredEpisodes
        case .characters:
            return filteredCharacters
        case .locations:
            return filteredLocations
        }
    }
}
