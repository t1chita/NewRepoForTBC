//
//  MainScreenView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 28.05.24.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject var mainScreenViewModel = MainScreenViewModel()
    @StateObject var randomTipsViewModel = RandomTipsViewModel()
    @State var travelTipShowed = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    travelTipsButtonView
                    
                    ListView()
                }
            }
        }
        .environmentObject(mainScreenViewModel)
        .environmentObject(randomTipsViewModel)
    }
    
    private var travelTipsButtonView: some View {
        VStack {
         
            HStack {
                Text("Best Cities To Travel")
                    .font(.title)
                    .foregroundColor(.myLabel)
                    Spacer()
                Button {
                    randomTipsViewModel.getRandomTip()
                    travelTipShowed = true
                } label: {
                    Text("Get Travel Tip ✈️")
                        .foregroundColor(.myLabel)
                }
                .frame(width: 150, height: 30)
                .background(
                    Color.cardsBackground
                )
                .cornerRadius(5)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2)
                })
            
                Spacer()
            }
            .padding()

        }
        .alert(isPresented: $travelTipShowed) {
            Alert(title: Text("Your Travel Tip✈️"),
                  message: Text("✅\(randomTipsViewModel.tip ?? "Don't Do Stupid Things")"),
                  dismissButton: .default(Text("Cancel"))
            )
        }
    }
       
}

