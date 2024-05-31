//
//  SearchPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct SearchPageView: View {
    @StateObject var searchPageViewModel: SearchPageViewModel

    init(searchPageViewModel: SearchPageViewModel) {
        self._searchPageViewModel = StateObject(wrappedValue: searchPageViewModel)
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    Picker("Choose Category", selection: $searchPageViewModel.selectedSlide) {
                        ForEach(SlideOfCategory.allCases, id: \.self) {
                            Text($0.rawValue)
                                .foregroundColor(.myLabel)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    List {
                        ForEach(searchPageViewModel.filteredItems, id: \.id) { item in
                            Text(item.name)
                                .foregroundColor(.myLabel)
                            
                        }
                        .listRowBackground(Color.cardsBackground)
                        .scrollContentBackground(.hidden)
                    }
                    .background(Color.myBackground)
                    
                    Spacer()
                }
                .navigationTitle("\(searchPageViewModel.selectedSlide.rawValue)")
                .searchable(text: $searchPageViewModel.searchTerm, prompt: Text("Search \(searchPageViewModel.selectedSlide.rawValue)"))
                .foregroundColor(.cardsBackground)
            }
            .background(Color.myBackground)
            .environmentObject(searchPageViewModel)
        }
        .background(Color.myBackground)
    }
}

