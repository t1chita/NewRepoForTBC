//
//  ProgressBar.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 24.05.24.
//

import SwiftUI

struct ProgressBar: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Progress")
                    .frame(width: 85, height: 20)
                    .foregroundColor(.darkModeLabel)
                
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.progressViewRectangle)
                
                HStack {
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Daily Task")
                            .foregroundColor(.darkModeLabel)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("3/6 Task Completed")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Keep Working")
                            .foregroundColor(.darkModeLabel).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 14, weight: .ultraLight))
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1)
                                .frame(maxWidth: .infinity, maxHeight: 20)
                                .background(Color.progress).opacity(0.41)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 20)
                                .background(
                                    Color.progress
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                )
                                .foregroundColor(.clear)
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 15, leading: 16, bottom: 0, trailing: 10))
                    Spacer() 
                }
                HStack {
                    Spacer()
                    Text("50%")
                        .foregroundColor(.darkModeLabel)
                        .font(.system(size: 18, weight: .regular))
                }
                .padding(EdgeInsets(top: 33, leading: 0, bottom: 0, trailing: 32))
            }
        }
    }
}

#Preview {
    ProgressBar()
}
