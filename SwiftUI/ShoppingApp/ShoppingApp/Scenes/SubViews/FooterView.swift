//
//  FooterView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 26.05.24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                .frame(height: 100)
                .foregroundColor(Color(UIColor.systemBackground)
                .opacity(0.8))
                .padding(.horizontal, 22)
                .overlay(content: {
                    UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color(UIColor.systemBackground)
                            .opacity(0.8))
                        .padding(.horizontal, 22)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("პროდუქციის რაოდენობა: 340")
                            
                            Text("გადასახდელი თანხა: 1378 ლარი")
                            Spacer()
                        }
                        VStack {
                            Button(action: {
                                //TODO: add Navigate To Google Com
                            }, label: {
                                Text("გადახდა")
                                    .font(.system(size: 8, weight: .bold))
                                    .foregroundColor(.primary)
                                    .opacity(0.8)
                            })
                            .frame(width: 70, height: 20)
                            .border((Color.primary).opacity(0.8), width: 2)
                            .background(Color(UIColor.systemBackground))
                            .contentShape(Rectangle())
                        }
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(.trailing , 3)
                    ZStack {
                        VStack {
                            Spacer()
                            UnevenRoundedRectangle(bottomLeadingRadius: 21, bottomTrailingRadius: 21)
                                .frame(height: 30)
                                .foregroundColor(Color(UIColor.systemCyan))
                                .opacity(0.8)
                                .padding(.horizontal, 22)
                        }
                      
                        VStack {
                            Spacer()
                            Text("Shopping Cart")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.primary)
                        }
                        .padding(.bottom, 10)
                    }
                })
        }
    }
}

#Preview {
    FooterView()
}
