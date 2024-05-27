//
//  HeaderView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 25, topTrailingRadius: 25)
                .frame(height: 200)
                .foregroundColor(.background)
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                .overlay(content: {
                    UnevenRoundedRectangle(topLeadingRadius: 25, topTrailingRadius: 25)
                        .stroke(lineWidth: 3)
                        .foregroundColor(.border)
                        .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                    
                    ZStack {
                        VStack {
                            UnevenRoundedRectangle(topLeadingRadius: 25, topTrailingRadius: 25)
                                .frame(height: 60)
                                .foregroundColor(.background)
                                .padding(EdgeInsets(top: 1, leading: 23, bottom: 0, trailing: 23))
                            Spacer()
                        }
                        
                        VStack {
                            HStack {
                                Text("Fruits")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.myLabel)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 15, leading: 28, bottom: 20, trailing: 0))
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image(.profile)
                                    .resizable()
                                    .overlay(
                                        Circle()
                                            .stroke(lineWidth: 4)
                                            .foregroundColor(Color(UIColor.systemBackground)
                                            .opacity(0.8))         
                                    )
                                    .frame(width: 48, height: 48)
                                    .cornerRadius(25)
                            }
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 25))
                    }
                    
                    VStack(content: {
                        Spacer()
                        Image(.fruits)
                            .resizable()
                            .frame(width: 346, height: 140)
                            .opacity(0.9)
                    })
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                })
        }
    }
}

#Preview {
    HeaderView()
}
