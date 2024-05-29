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
                Text(country.description)
                    .foregroundColor(.myLabel)
                
                Spacer()
                
                buttonsView
            }
            .padding(.horizontal, 16)
        }
        .background(Color.myBackground)
    }
    
    private var buttonsView: some View {
        
        VStack {
            Spacer()
            
            HStack {
            
                NavigationLink(destination: HotelsView(navPath: $navPath, index: index)) {
                    Text("Hotels")
                        .foregroundColor(.myLabel)
                        .padding(6)
                        .frame(width: 100, height: 50)
                        .background(Color.cardsBackground)
                        .cornerRadius(5)
                }
                
                Spacer()
                
                NavigationLink(destination: TransportView(index: index, navPath: $navPath)) {
                    Text("Transport")
                        .foregroundColor(.myLabel)
                        .padding(6)
                        .frame(width: 100, height: 50)
                        .background(Color.cardsBackground)
                        .cornerRadius(5)
                }
                
                Spacer()
                
                NavigationLink(destination: MustSeeView(index: index, navPath: $navPath)) {
                    Text("Must See")
                        .foregroundColor(.myLabel)
                        .padding(6)
                        .frame(width: 100, height: 50)
                        .background(Color.cardsBackground)
                        .cornerRadius(5)
                }
            }
        }
    }
}
