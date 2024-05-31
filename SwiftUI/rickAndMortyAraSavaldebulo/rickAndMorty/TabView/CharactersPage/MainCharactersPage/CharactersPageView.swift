//
//  CharactersPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import SwiftUI

struct CharactersPageView: View {
    @EnvironmentObject var charactersViewModel: CharactersPageViewModel
    
    var body: some View {
        CharactersList()
            .background(Color.myBackground)
    }
    
    private struct CharactersList: View {
        @EnvironmentObject var charactersViewModel: CharactersPageViewModel
        @State var navPath: [Int] = []
        let columns = [GridItem(), GridItem()]
        
        var body: some View {
            ZStack {
                NavigationStack(path: $navPath) {
                    ScrollView {
                        gridView
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
        
        private var gridView: some View {
            LazyVGrid(columns: columns) {
                ForEach(charactersViewModel.characters, id: \.id) { character in
                    NavigationLink(value: character.id) {
                        CharactersRow(character: character)
                    }
                }
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
