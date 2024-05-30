//
//  TransportView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct TransportView: View {
    @ObservedObject var viewModel = TransportViewModel()
    @Binding var navPath: [Int]
    var index: Int
    
    var body: some View {
        VStack {
            Text("Transport List")
                .font(.title)
                .foregroundColor(.myLabel)
            
            if !viewModel.transports.isEmpty {
                TransportsListView(hotels: viewModel.transports, index: index)
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
            .frame(width: 200, height: 50)
            .background(Color.cardsBackground)
            .cornerRadius(5)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}


struct TransportsListView: View {
    var hotels: [Transport]
    var index: Int
    var body: some View {
        List {
            ForEach(hotels[index].transport, id: \.self) { hotel in
                Text(hotel)
            }
        }
    }
}



