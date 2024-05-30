//
//  HotelsView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct HotelsView: View {
    @ObservedObject var viewModel = HotelsViewModel()
    @Binding var navPath: [Int]
    var index: Int
    
    var body: some View {
        VStack {
            Text("Hotels List")
                .font(.title)
                .foregroundColor(.myLabel)
            
            if !viewModel.hotelsArray.isEmpty {
                HotelsListView(hotels: viewModel.hotelsArray, index: index)
            } else {
                ProgressView()
            }
            
            Spacer()
            
            Button(action: {
                navPath.removeAll()
            }, label: {
                Text("Go To Main Screen")
                    .foregroundColor(.myLabel)
                    .padding(6)
            })
            .frame(width: 170, height: 50)
            .background(Color.cardsBackground)
            .cornerRadius(5)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}


struct HotelsListView: View {
    var hotels: [HotelCategory]
    var index: Int
    var body: some View {
        List {
            ForEach(hotels[index].hotels, id: \.self) { hotel in
                Text(hotel)
            }
        }
    }
}
