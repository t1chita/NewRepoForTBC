//
//  BodyView.swift
//  ShoppingApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct BodyView: View {
    var products: [Product] = ProductList.products
    var body: some View {
        ForEach(products) { product in
            FruitsListViewCell(product: product)
                .padding(.top, 10)
        }
    }
}
#Preview {
    BodyView()
}
#Preview {
    ContentView()
}

struct FruitsListViewCell : View {
    var product: Product
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color(UIColor.systemCyan))
                .frame(width: 340, height: 100)
            HStack {
                Image(.fruit)
                    .resizable()
                    .frame(width: 100,height: 100)
                
                VStack {
                    Spacer()
                    Button(action: {
                        //TODO: Add Delete From Cart Action
                    }, label: {
                        Text("კალათიდან ამოღება")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.primary)
                            .opacity(0.8)
                    })
                    .frame(width: 100, height: 30)
                    .border((Color.primary).opacity(0.8), width: 2)
                    .background(Color(UIColor.systemBackground))
                    .contentShape(Rectangle())
                }
                .padding(.bottom, 3)
                Spacer()
            }
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text(product.name)
                        .foregroundColor(Color(UIColor.systemBackground)
                        .opacity(0.8))
                        .font(.system(size: 16, weight: .bold))
                }
                
                HStack {
                    Spacer()
                    Text("ფასი: \(product.price) ლარი")
                        .foregroundColor(.black).opacity(0.6)
                        .font(.system(size: 12, weight: .regular))
                }
                
                HStack {
                    Button(action: {
                        //TODO: Add + Button Logic
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color(UIColor.systemBackground))
                    })
                    .contentShape(Circle()) 
                    Button(action: {
                        //TODO: Add - Button Logic
                    }, label: {
                        Image(systemName: "minus.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(Color(UIColor.systemBackground))
                    })
                    .contentShape(Circle())
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 18))
        })
        .padding(.leading, 20)
    }
}
