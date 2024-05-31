//
//  EpisodesDetailsPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct EpisodesDetailsPageView: View {
    @StateObject var episodesDetailsViewModel: EpisodesDetailsPageViewModel
    @Binding var navPath: [Int]
    var episode: Episode
    init(navPath: Binding<[Int]>, episode: Episode) {
        self._episodesDetailsViewModel = StateObject(wrappedValue: EpisodesDetailsPageViewModel(episode: episode))
        self._navPath = navPath
        self.episode = episode
    }
    
    var body: some View {
        Text("Characters In \(episode.name)")
            .font(.title)
            .bold()
        List {
            ForEach(episodesDetailsViewModel.characters, id: \.id) { character in
                VStack {
                    CharacterImageView(url: URL(string: character.image)!)
                    Text(character.name)
                        .foregroundColor(.myLabel)
                }
                .listRowBackground(Color.clear)
            }
        }
        .onAppear {
            episodesDetailsViewModel.fetchChars(episode: episode)
        }
    }
}

#Preview {
    ContentView()
}
