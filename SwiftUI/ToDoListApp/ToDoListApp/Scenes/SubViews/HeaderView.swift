//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 24.05.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("You have 3 tasks to complete")
                    .frame(width: 190, height: 60)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
                
                ZStack {
                    Image(.profile)
                        .resizable()
                        .frame(width: 45, height: 45)
                        .scaledToFill()
                        .cornerRadius(22.5)
                        .overlay(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                            Circle()
                                .overlay(content: {
                                    Text("3")
                                        .font(.system(size: 9, weight: .regular))
                                        .foregroundColor(.white)
                                })
                                .frame(width: 15, height: 15)
                                .foregroundColor(.notfCircle)
                        })
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 22))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                
            Button(action: {
                    
                }, label: {
                    Text("Complete All")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(
                LinearGradient(gradient: Gradient(colors: [.buttonColorStart, .buttonColorEnd]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(8)
            .padding(EdgeInsets(top: 37, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

#Preview {
    HeaderView()
}
