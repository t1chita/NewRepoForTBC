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
            
            Text(character.name)
                .font(.title)
                .foregroundColor(.myLabel)
            
            characterDetailsList
            
            Text("Episodes")
                .font(.title)
                .foregroundColor(.myLabel)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.cardsBackground)
                )
            
            charactersEpisodes
                .padding(.horizontal, 16)
            
            Spacer()
        }
    }
    
    private var characterDetailsList: some View {
        ScrollView {
            VStack {
                DescriptionOfCharacter(title: "Status",
                                       value: character.status)
                
                DescriptionOfCharacter(title:"Gender",
                                       value: character.gender)
                
                DescriptionOfCharacter(title: "Species",
                                       value: character.species)
                
                DescriptionOfCharacter(title: "Origin",
                                       value: character.origin.name)
            }
        }
        .padding(.horizontal, 16)
    }
    
    private struct DescriptionOfCharacter: View {
        let title: String
        let value: String
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.cardsBackground)
                    .frame(maxWidth: .infinity, maxHeight: 45)
                
                HStack {
                    Text("\(title):\(value)")
                        .foregroundColor(.myLabel)
                        .frame(alignment: .leading)
                        .padding(5)
                    
                    Spacer()
                }
            }
        }
    }
    
    private var charactersEpisodes: some View {
        ScrollView {
            ForEach(characterDetailsViewModel.episodes, id: \.self) { episode in
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.cardsBackground)
                    
                    HStack {
                        Text(episode)
                            .foregroundColor(.myLabel)
                            .padding(5)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
