//
//  EpisodesPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct EpisodesPageView: View {
    @EnvironmentObject var episodesViewModel: EpisodesPageViewModel
    
    @State var navPath: [Int] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            Text("You have \(episodesViewModel.favouriteEpisodesQuantity) favourite episodes")
                .foregroundColor(.myLabel)
            ListOfEpisodes(episodes: episodesViewModel.episodes)
                .navigationDestination(for: Int.self) { id in
                    let episode = episodesViewModel.getEpisode(with: id)
                    EpisodesDetailsPageView(navPath: $navPath, episode: episode)
                }
                .navigationTitle("Episodes")
        }
    }
}

private struct ListOfEpisodes: View {
    let episodes: [Episode]
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(episodes, id: \.id) { episode in
                    NavigationLink(value: episode.id) {
                        EpisodesCard(episode: episode)
                    }
                }
            }
        }
    }
}

private struct EpisodesCard: View {
    @EnvironmentObject var episodeViewModel: EpisodesPageViewModel
    
    @State var isFavourite: Bool = false
    
    var episode: Episode
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.cardsBackground)
            HStack {
                VStack(alignment: .leading) {
                    Text(episode.name)
                        .font(.system(size: 16))
                        .lineLimit(1)
                    
                    Text(episode.airDate)
                    
                    Text(episode.episode)
                }
                .font(.system(size: 8))
                .foregroundColor(.myLabel)
                
                Spacer()
                
                Button(action: {
                    if !isFavourite {
                        episodeViewModel.favouriteEpisode(episode: episode)
                    } else {
                        episodeViewModel.unFavouriteEpisode(episode: episode)
                    }
                    isFavourite.toggle()
                }, label: {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .foregroundColor(isFavourite ? .red : .myLabel )
                })
            }
            .padding()
        }
        .frame(width: 190, height: 100)
    }
}

#Preview {
    ContentView()
}
