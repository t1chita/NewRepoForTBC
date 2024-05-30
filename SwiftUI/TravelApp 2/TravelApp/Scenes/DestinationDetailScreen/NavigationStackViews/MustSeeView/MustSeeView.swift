//
//  MustSeeView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

import SwiftUI

struct MustSeeView: View {
    @ObservedObject var viewModel = MustSeeViewModel()
    @Binding var navPath: [Int]
    var index: Int
    var body: some View {
        VStack {
            Text("Transport List")
                .font(.title)
                .foregroundColor(.myLabel)
            
            if !viewModel.mustSees.isEmpty {
                MustSeeListView(hotels: viewModel.mustSees, index: index)
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

struct MustSeeListView: View {
    var hotels: [MustSee]
    var index: Int
    var body: some View {
        List {
            ForEach(hotels[index].mustSee, id: \.self) { hotel in
                Text(hotel)
            }
        }
    }
}
