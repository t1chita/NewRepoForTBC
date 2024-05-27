//
//  BodyView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct BodyView: View {
    @StateObject var productViewModel: ProductViewModel
    var body: some View {
        ForEach(productViewModel.products) { product in
            FruitsListViewCell(product: product, viewModel: productViewModel)
                .padding(.top, 10)
        }
    }
}

struct FruitsListViewCell : View {
    var product: Product
    var viewModel: ProductViewModel

    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(.background)
                .frame(width: 350, height: 100)
            
            HStack {
                Image(product.image)
                    .resizable()
                    .frame(width: 70,height: 70)
                    .cornerRadius(20)
                    .padding(.leading, 30)
                
                VStack(alignment: .leading) {
                    Text ("პროდუქტის \nრაოდენობა: \(product.counter) ")
                        .foregroundColor(.myLabel)
                        .font(.system(size: 12, weight: .regular))
                    
                    Text ("ჯამური თანხა: \(product.totalPrice) ")
                        .foregroundColor(.myLabel)
                        .font(.system(size: 12, weight: .regular))
                    
                    removeFromCartButtonView
                }
                .padding(.top, 15)
                Spacer()
            }
            
            productInfoView
                .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 30))
        })
        
    }
    
    private var removeFromCartButtonView: some View {
        VStack {
            Spacer()
            
            Button(action: {
                viewModel.deleteProductFromCart(id: product.id)
            }, label: {
                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .frame(width: 29, height: 29)
                    .foregroundColor(.border)
                    .opacity(0.8)
            })
            .background(
                Circle()
                    .foregroundColor(.background)
            )
            .contentShape(Rectangle())
            .padding(.bottom, 5)
        }
    }
    
    private var productInfoView: some View {
        VStack(alignment: .trailing) {
            productNameView
            
            productPriceView
            
            addAndRemoveProductFromCartButtonsView
            
            Spacer()
        }
    }
    
    private var productNameView: some View {
        HStack {
            Spacer()
            
            Text(product.name)
                .foregroundColor(.myLabel)
                .font(.system(size: 16, weight: .bold))
        }
    }
    private var productPriceView: some View {
        HStack {
            Spacer()
            
            Text("ფასი: \(product.price) ლარი")
                .foregroundColor(.myLabel)
                .font(.system(size: 12, weight: .regular))
        }
    }
    
    private var addAndRemoveProductFromCartButtonsView: some View {
        HStack {
            Button(action: {
                addButtonTapped()
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.border)
            })
            .contentShape(Circle())
            
            Button(action: {
                removeButtonTapped()
            }, label: {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .foregroundColor(.border)
            })
            .contentShape(Circle())
        }
    }
    
    private func addButtonTapped() {
        viewModel.increaseSelectedProductCounter(id: product.id)
    }
    
    private func removeButtonTapped() {
        viewModel.decreaseSelectedProductCounter(id: product.id)
    }
}


#Preview {
    ContentView()
}
