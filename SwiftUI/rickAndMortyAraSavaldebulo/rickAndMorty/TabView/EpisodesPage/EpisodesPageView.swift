//
//  EpisodesPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct EpisodesPageView: View {
    @EnvironmentObject var episodesViewModel: EpisodesPageViewModel
    var body: some View {
        VStack {
            Text("Episodes")
                .font(.title)
            ListOfEpisodes()
        }
    }
    
    private struct ListOfEpisodes: View {
        @EnvironmentObject var episodesViewModel: EpisodesPageViewModel
        let columns = [GridItem(), GridItem()]
        var body: some View {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(episodesViewModel.episodes, id: \.id) { episode in
                            EpisodesCard(episode: episode)
                        }
                    }
                }
            }
        }
    }
    
    private struct EpisodesCard: View {
        var episode: Episodes
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.cardsBackground)
                HStack {
                    VStack(alignment: .leading) {
                        Text(episode.name)
                            .font(.system(size: 16))
                        Text(episode.airDate)
                        Text(episode.episode)
                    }
                    .font(.system(size: 8))
                    .foregroundColor(.myLabel)
                    Spacer()
                }
                .padding()
            }
            .frame(width: 180, height: 100)
        }
    }
}
