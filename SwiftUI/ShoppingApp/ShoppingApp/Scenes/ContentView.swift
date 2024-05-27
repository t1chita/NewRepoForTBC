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
                }
                .frame(maxWidth: .infinity,maxHeight:  400)
                
                Spacer()
                
                FooterView(viewModel: viewModel)
            }
        })
        .background(Color.myBackground)
    }
}

#Preview {
    ContentView()
}
