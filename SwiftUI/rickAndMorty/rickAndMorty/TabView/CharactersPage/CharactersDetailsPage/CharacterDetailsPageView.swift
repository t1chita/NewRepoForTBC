//
//  CharacterDetailsPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct CharacterDetailsPageView: View {
    @StateObject var characterDetailsViewModel: CharacterDetailsPageViewModel
    @Binding var navPath: [Int]
    var character: CartoonCharacter
    
    init(character: CartoonCharacter, navPath: Binding<[Int]>) {
        self._characterDetailsViewModel = StateObject(wrappedValue: CharacterDetailsPageViewModel(character: character))
        self._navPath = navPath
        self.character = character
    }
    
    var body: some View {
        VStack {
            CharacterLargeImageView(url: URL(string: character.image)!)
            
            VStack {
                characterNameView
                characterDetailsList
                charactersEpisodes
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .padding(.top, 16)
        }
        .background(Color.myBackground)
    }
    
    private var characterNameView: some View {
        Text(character.name)
            .font(.title)
            .foregroundColor(.myLabel)
            .padding(.vertical, 8)
    }
    
    private var characterDetailsList: some View {
        ScrollView {
            VStack(spacing: 10) {
                DescriptionOfCharacter(title: "Status", value: character.status)
                DescriptionOfCharacter(title: "Gender", value: character.gender)
                DescriptionOfCharacter(title: "Species", value: character.species)
                DescriptionOfCharacter(title: "Origin", value: character.origin.name)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private var charactersEpisodes: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(characterDetailsViewModel.episodes, id: \.id) { episode in
                    EpisodeRow(episode: episode)
                }
            }
        }
    }
}

private struct DescriptionOfCharacter: View {
    let title: String
    let value: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.cardsBackground)
                .frame(height: 45)
            
            HStack {
                Text("\(title): \(value)")
                    .foregroundColor(.myLabel)
                    .padding(5)
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

private struct EpisodeRow: View {
    let episode: Episode
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.cardsBackground)
            
            HStack {
                LazyVStack(alignment: .leading) {
                    Text("Name: \(episode.name)")
                        .font(.system(size: 16))
                    Text("Date: \(episode.airDate)")
                    Text("Episode: \(episode.episode)")
                }
                .foregroundColor(.myLabel)
                .padding(5)
                
                Spacer()
            }
            .padding(5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
