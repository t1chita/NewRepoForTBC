//
//  ProgressBarView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 25.05.24.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var counter: CGFloat
    var width: CGFloat = 340
    var heigth: CGFloat = 20
    var percent: CGFloat = 10
    var body: some View {
        let multiplier = width / 100
        VStack(alignment: .leading) {
            HStack {
                Text("Progress")
                    .frame(width: 85, height: 20)
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.progressViewRectangle)
                
                HStack {
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Daily Task")
                            .foregroundColor(.darkModeLabel)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("\(Int(counter))/6 Task Completed")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Keep Working")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 14, weight: .ultraLight))
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: heigth)
                                .stroke(lineWidth: 1)
                                .frame(width: width, height: heigth)
                                .background(Color.progress).opacity(0.41)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            RoundedRectangle(cornerRadius: heigth)
                                .frame(width: multiplier * percent, height: heigth)
                                .background(
                                    Color.progress
                                        .clipShape(RoundedRectangle(cornerRadius: heigth))
                                )
                                .foregroundColor(.clear)
                        }
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 15, leading: 14, bottom: 0, trailing: 0))
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Text("\(Int(percent)) %")
                        .foregroundColor(.darkModeLabel)
                        .font(.system(size: 18, weight: .regular))
                }
                .padding(EdgeInsets(top: 33, leading: 0, bottom: 0, trailing: 32))
            }
            .padding(EdgeInsets(top: 15, leading: 16, bottom: 0, trailing: 10))
        }
    }
}

