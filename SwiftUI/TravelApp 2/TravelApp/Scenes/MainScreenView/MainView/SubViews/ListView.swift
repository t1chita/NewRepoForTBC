//
//  CountryRow.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    @State private var navPath: [Int] = []
    var body: some View {
        NavigationStack(path: $navPath) {
            Text("Choose Your Desired Country Or City")
                .foregroundColor(.myLabel)
            
            List(viewModel.countryInfoArray) { country in
                NavigationLink(value: country.id) {
                    CountryRow(country: country)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .onAppear{
                URLCache.shared.memoryCapacity = 1024 * 1024 * 512
            }
            .navigationDestination(for: Int.self) { countryId in
                if let country = viewModel.countryInfoArray.first(where: {$0.id == countryId}) {
                    if let index = viewModel.countryInfoArray.firstIndex(where: {$0.id == country.id }) {
                        DestinationDetailScreenView(country: country, index: index, navPath: $navPath)
                    }
                }
            }
        }
    }
}


struct CountryRow: View {
    var country: Slide
    var body: some View {  
        VStack(alignment: .leading) {
            ImageLoadingView(url: country.image.src)
            
            Text(country.title)
                .foregroundColor(.primary)
            
            Text(country.description)
                .foregroundColor(.myLabel)
        }
    }
}

