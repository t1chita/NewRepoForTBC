//
//  CharactersPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import SwiftUI

struct CharactersPageView: View {
    @StateObject var charactersViewModel = CharactersPageViewModel()
    
    var body: some View {
        CharactersList()
            .environmentObject(charactersViewModel)
    }
   
   private struct CharactersList: View {
        @EnvironmentObject var charactersViewModel: CharactersPageViewModel
        let columns = [GridItem(), GridItem()]
        @State var navPath: [Int] = []
       
        var body: some View {
            NavigationStack(path: $navPath) {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(charactersViewModel.characters, id: \.id) { character in
                            NavigationLink(value: character.id) {
                                CharactersRow(character: character)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .navigationDestination(for: Int.self) { id in
                    let character = charactersViewModel.getCharacter(id: id)
                    CharacterDetailsPageView(character: character, navPath: $navPath)
                }
                .navigationTitle("Characters")
            }
        }
    }
    
    private struct CharactersRow: View {
        var character: CartoonCharacter
        
        var body: some View {
            VStack {
                CharacterImageView(url: URL(string: character.image)!)
                
                Text(character.name)
                    .font(.system(size: 12, weight: .bold))
            }
        }
    }
}
