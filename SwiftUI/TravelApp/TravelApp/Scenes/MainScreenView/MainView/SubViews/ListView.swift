//
//  CountryRow.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    var body: some View {
            Text("Choose Your Desired Country Or City")
                .foregroundColor(.myLabel)
            
            List(viewModel.countryInfoArray) { country in
                NavigationLink(value: country) {
                    CountryRow(country: country)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .onAppear{
                URLCache.shared.memoryCapacity = 1024 * 1024 * 512
            }
            .navigationDestination(for: Slide.self) { country in
                DestinationDetailScreenView(country: country)
            }
    }
}


struct CountryRow: View {
    var country: Slide
    var body: some View {  
#warning("ყველაფერი წაშალე ამის გარდა")
        VStack(alignment: .leading) {
            ImageLoadingView(url: country.image.src)
            Text(country.title)
                .foregroundColor(.primary)
            Text(country.description)
                .foregroundColor(.myLabel)
        }
    }
}
//
//#Preview {
//    MainScreenView()
//}
