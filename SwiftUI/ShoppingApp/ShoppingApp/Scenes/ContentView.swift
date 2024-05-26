//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            VStack {
                HeaderView()
                
                Spacer()
                ScrollView {
                    BodyView()
                    FooterView()
                        .padding(.top, 20)
                }
                .frame(height: 600)
            }
        })
        .background(
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(0.8)
        )
    }
}

#Preview {
    ContentView()
}
