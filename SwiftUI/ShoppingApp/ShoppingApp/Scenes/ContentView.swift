//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductViewModel()
   
    var body: some View {
        ZStack(content: {
            VStack {
                HeaderView()
                
                ScrollView {
                    BodyView(productViewModel: viewModel)
                        .padding(.top, 30)
                }
                .frame(height: 400)
                Spacer()
                FooterView(viewModel: viewModel)
            }
        })
        .background(
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ContentView()
}
