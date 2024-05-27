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
                .frame(maxWidth: .infinity, maxHeight: 200)
                .foregroundColor(.background)
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                .overlay(content: {
                    borderView
                    
                    contentView
                    
                    mainImage
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                })
        }
    }
    
    //MARK: Private Views
    private var borderView: some View {
        UnevenRoundedRectangle(topLeadingRadius: 25, topTrailingRadius: 25)
            .stroke(lineWidth: 3)
            .foregroundColor(.border)
            .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
    }
    
    private var contentView: some View {
        ZStack {
            titleView
            .padding(EdgeInsets(top: 15, leading: 28, bottom: 20, trailing: 0))
            
            profileImage
            .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 25))
        }
    }
    
    private var titleView: some View {
        VStack {
            HStack {
                Text("Fruits")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.myLabel)
                
                Spacer()
            }
            
            Spacer()
        }
    }
    
    private var profileImage: some View {
        VStack {
            HStack {
                Spacer()
                
                Image(.profile)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(25)
            }
            
            Spacer()
        }
    }
    private var mainImage: some View {
        VStack(content: {
            Spacer()
            
            Image(.fruits)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 140)
                .opacity(0.9)
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
        })
    }
}

#Preview {
    ContentView()
}
