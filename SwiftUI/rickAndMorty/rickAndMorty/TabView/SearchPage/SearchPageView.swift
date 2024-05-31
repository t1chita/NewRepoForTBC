//
//  SearchPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

import SwiftUI

struct SearchPageView: View {
    @StateObject var searchPageViewModel: SearchPageViewModel
    
    init(searchPageViewModel: SearchPageViewModel) {
        self._searchPageViewModel = StateObject(wrappedValue: searchPageViewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                categoryPicker
                
                filteredItemsList
            }
            .navigationTitle("Search")
            .searchable(text: $searchPageViewModel.searchTerm, prompt: Text("Search \(searchPageViewModel.selectedSlide.rawValue)"))
        }
    }
    
    private var categoryPicker: some View {
        Picker("Choose Category", selection: $searchPageViewModel.selectedSlide) {
            ForEach(SlideOfCategory.allCases, id: \.self) { slide in
                Text(slide.rawValue)
                    .foregroundColor(.myLabel)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    private var filteredItemsList: some View {
        List {
            ForEach(searchPageViewModel.filteredItems, id: \.id) { item in
                Text(item.name)
                    .foregroundColor(.myLabel)
            }
            .listRowBackground(Color.cardsBackground)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
