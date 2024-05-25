//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var incompletedCounterBadge: CGFloat
    @Binding var incompletedCounter: CGFloat
    @Binding var isAllTaskCompleted: Bool
    var body: some View {
        VStack(alignment: .leading) {
            UserView(incompletedCounter: $incompletedCounter, incompletedCounterBadge: $incompletedCounterBadge)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            CompleteAllButtonView(isAllTaskCompleted: $isAllTaskCompleted)
        }
    }
}

struct UserView: View {
    @Binding var incompletedCounter: CGFloat
    @Binding var incompletedCounterBadge: CGFloat
    var body: some View {
        HStack {
            Text("You have \(Int(incompletedCounter)) tasks to complete")
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
                                Text("\(Int(incompletedCounterBadge))")
                                    .font(.system(size: 9, weight: .regular))
                                    .foregroundColor(.white)
                            })
                            .frame(width: 15, height: 15)
                            .foregroundColor(.notfCircle)
                    })
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 22))
            }
        }
    }
}

struct CompleteAllButtonView: View {
    @Binding var isAllTaskCompleted: Bool
    var body: some View {
        Button(action: {
            isAllTaskCompleted = true
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
