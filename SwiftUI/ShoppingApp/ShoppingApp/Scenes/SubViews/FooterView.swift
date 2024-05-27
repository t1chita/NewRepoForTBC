//
//  FooterView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 26.05.24.
//

import SwiftUI

struct FooterView: View {
    @StateObject var viewModel: ProductViewModel
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                .frame(height: 150)
                .foregroundColor(.background)
                .padding(.horizontal, 22)
                .overlay(content: {
                    borderView
                    cartInfoView
                    cartLabelFullView
                })
        }
    }
    private var borderView: some View {
        UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
            .stroke(lineWidth: 3)
            .foregroundColor(.border)
            .padding(.horizontal, 22)
    }
    
    private var cartInfoView: some View {
        HStack {
            selectedProductsInfoView
            
            payButtonView
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
        }
        .padding(.trailing , 3)
    }
    
    private var selectedProductsInfoView: some View {
        VStack(alignment: .leading) {
            Text("პროდუქციის რაოდენობა: \(viewModel.productsQuantity)")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.myLabel)
                .opacity(0.8)
            Text("გადასახდელი თანხა: \(viewModel.productsTotalPrice) ლარი")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.myLabel)
                .opacity(0.8)
            
            saleButtonView
                .padding(.top, 20)
            Spacer()
        }
    }

    private var saleButtonView: some View {
        Button(action: {
            //TODO: add 20% Sale Action
        }, label: {
            Text("20% ფასდაკლება")
                .font(.system(size: 8, weight: .bold))
                .foregroundColor(.myLabel)
                .opacity(0.8)
        })
        .frame(width: 100, height: 40)
        .background(Color.background)
        .cornerRadius(10)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .foregroundColor(.border)
        })
        .contentShape(RoundedRectangle(cornerRadius: 10))
    }

    private var payButtonView: some View {
        VStack {
            Button(action: {
                //TODO: add Navigate To Google Com
            }, label: {
                Text("გადახდა")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.myLabel)
                    .opacity(0.8)
            })
            .frame(width: 70, height: 40)
            .background(Color.background)
            .cornerRadius(10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.border)
            })
            .padding(.top, 13)
            .contentShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    private var cartLabelFullView: some View {
        ZStack {
            cartLabelBackgroundView
            
            cartLabelView
                .padding(.bottom, 10)
        }
    }

    private var cartLabelBackgroundView: some View {
        VStack {
            Spacer()
            UnevenRoundedRectangle(bottomLeadingRadius: 21, bottomTrailingRadius: 21)
                .frame(height: 30)
                .foregroundColor(.border)
                .opacity(0.8)
                .padding(.horizontal, 24)
                .padding(.bottom, 1.5)
        }
    }

    private var cartLabelView: some View {
        VStack {
            Spacer()
            Text("Shopping Cart")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.myLabel)
        }
    }
}

#Preview {
    ContentView()
}
