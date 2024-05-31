//
//  CharactersPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import SwiftUI

struct CharactersPageView: View {
    @EnvironmentObject var charactersViewModel: CharactersPageViewModel
    @State var navPath: [Int] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
                CharactersList(characters: charactersViewModel.characters)
                    .navigationDestination(for: Int.self) { id in
                        let character = charactersViewModel.getCharacter(id: id)
                        CharacterDetailsPageView(character: character, navPath: $navPath)
                    }
                    .navigationTitle("Characters")
        }
    }
}

private struct CharactersList: View {
    let characters: [CartoonCharacter]
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(characters, id: \.id) { character in
                    NavigationLink(value: character.id) {
                        CharactersRow(character: character)
                    }
                }
            }
            .padding(.horizontal, 16)
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

#Preview {
    ContentView()
}
