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
    var index: Int
    @Binding var navPath: [Int]
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
