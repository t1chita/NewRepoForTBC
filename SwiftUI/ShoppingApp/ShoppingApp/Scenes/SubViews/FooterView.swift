//
//  FooterView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 26.05.24.
//

import SwiftUI

struct FooterView: View {
    @StateObject var viewModel: ProductViewModel
    @Environment(\.openURL) private var openURL
    @State private var showAlert = false
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(bottomLeadingRadius: 25, bottomTrailingRadius: 25)
                .frame(height: 150)
                .foregroundColor(.background)
                .padding(.horizontal, 22)
                .overlay(content: {
                    borderView
                    
                    cartInfoView
                    payButtonView
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 50))

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
            
        }
        .padding(.trailing , 3)
    }
    
    private var selectedProductsInfoView: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("პროდუქციის რაოდენობა: \(viewModel.productsQuantity)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.myLabel)
                    .opacity(0.8)
                    .padding(.top,10)
                
                Text("გადასახდელი თანხა: \(String(format: "%.02f", viewModel.productsTotalPrice)) ლარი")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.myLabel)
                    .opacity(0.8)
                
                saleButtonView
                    .padding(.top, 10)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.trailing, 30)
    }
    
    private var saleButtonView: some View {
        Button(action: {
            if viewModel.saleButtonTapped {
                showAlert = true
            } else {
                viewModel.applyTwentyPercentDiscount()
            }
        }, label: {
            Text("-20%")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.myLabel)
                .opacity(0.8)
        })
        .frame(width: 100, height: 40)
        .background(Color.discountButtonBackground)
        .cornerRadius(10)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .foregroundColor(.border)
        })
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("მოგინდა კიდე?🤡"), message: Text("ფასდაკლების გამოყენება შეგიძლია მხოლოდ ერთხელ"), dismissButton: .default(Text("ბოდიში 🙏🏿")))
        }
    }
    
    private var payButtonView: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    openGoogleCom()
                }, label: {
                    Text("გადახდა")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.myLabel)
                        .opacity(0.8)
                })
                .frame(width: 80, height: 40)
                .background(Color.payButtonBackground)
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
    
    private func openGoogleCom() {
        guard let url = URL(string: "https://www.google.com") else { return }
        openURL(url)
    }
}

#Preview {
    ContentView()
}
