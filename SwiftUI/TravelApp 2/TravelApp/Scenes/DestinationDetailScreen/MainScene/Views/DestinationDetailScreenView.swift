//
//  DestinationDetailScreenView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 28.05.24.
//

import SwiftUI

struct DestinationDetailScreenView: View {
    var country: Slide
    var index: Int
    @Binding var navPath: [Int]
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                LargeImageLoadingView(url: country.image.src)
                
                Text(country.title)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .padding(.top, 8)
                
                Text(country.description)
                    .foregroundColor(.myLabel)
                    .padding(.top, 4)
                
                Spacer()
                
                buttonsView
            }
            .padding(.horizontal, 16)
        }
        .background(Color.myBackground)
        .navigationTitle("Destination Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var buttonsView: some View {
        VStack {
            Spacer()
            
            HStack {
                NavigationButton(title: "Hotels", destination: HotelsView(navPath: $navPath, index: index))
                
                Spacer()
                
                NavigationButton(title: "Transport", destination: TransportView(navPath: $navPath, index: index))
                
                Spacer()
                
                NavigationButton(title: "Must See", destination: MustSeeView(navPath: $navPath, index: index))
            }
        }
    }
}

struct NavigationButton<Destination: View>: View {
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .foregroundColor(.myLabel)
                .padding(6)
                .frame(width: 100, height: 50)
                .background(Color.cardsBackground)
                .cornerRadius(5)
        }
    }
}

