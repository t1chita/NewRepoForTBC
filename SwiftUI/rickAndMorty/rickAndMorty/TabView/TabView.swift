//
//  TabView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import SwiftUI

struct MyTabView: View {
    @StateObject var charactersViewModel = CharactersPageViewModel()
    @StateObject var episodesViewModel = EpisodesPageViewModel()
    @StateObject var locationViewModel = LocationPageViewModel()
    
    var body: some View {
        let searchPageViewModel = SearchPageViewModel(episodesViewModel: episodesViewModel, charactersViewModel: charactersViewModel, locationsViewModel: locationViewModel)
        TabView {
            CharactersPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            EpisodesPageView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episodes")
                }
            SearchPageView(searchPageViewModel: searchPageViewModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            LocationPageView(locations: locationViewModel.locations)
                .tabItem {
                    Image(systemName: "map")
                    Text("Location")
                }
            
        }
        .accentColor(.myLabel)
        .environmentObject(charactersViewModel)
        .environmentObject(episodesViewModel)
    }
}

#Preview {
    MyTabView()
}
