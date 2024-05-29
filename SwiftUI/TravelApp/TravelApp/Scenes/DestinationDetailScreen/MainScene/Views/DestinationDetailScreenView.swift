//
//  DestinationDetailScreenView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 28.05.24.
//

import SwiftUI

struct DestinationDetailScreenView: View {
    var country: Slide
    var body: some View {
//        NavigationStack {
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
//        }
        .background(Color.myBackground)
    }
    
    private var buttonsView: some View {
        
        VStack {
            Spacer()
            
            HStack {
                Button(action: {
                
                }, label: {
                    Text("Hotels")
                        .foregroundColor(.myLabel)
                        .padding(6)
                })
                .frame(width: 100, height: 50)
                .background(Color.cardsBackground)
                .cornerRadius(5)
                NavigationLink(destination: HotelsView()) {
                    EmptyView()
                }
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Must See")
                        .foregroundColor(.myLabel)
                        .padding(6)
                })
                .frame(width: 100, height: 50)
                .background(Color.cardsBackground)
                .cornerRadius(5)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Transport")
                        .foregroundColor(.myLabel)
                        .padding(6)
                })
                .frame(width: 100, height: 50)
                .background(Color.cardsBackground)
                .cornerRadius(5)
            }
        }
    }
}
