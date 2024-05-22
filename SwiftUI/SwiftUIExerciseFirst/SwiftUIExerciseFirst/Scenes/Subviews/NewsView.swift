//
//  NewsView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        ZStack {
            Color.newsBackground
                .ignoresSafeArea()
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                        }, label: {
                            Image(.person)
                                .resizable()
                                .frame(width: 32, height: 32)
                        })
                        Spacer()
                    }
                    HStack {
                        Text("ცეცხლოვანი სიახლეები")
                            .foregroundColor(.white)
                            .frame(width: 61, height: 26)
                            .font(.system(size: 9, weight: .regular))
                            .lineLimit(2)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
                HStack {
                    Spacer()
                    Image(.rupori)
                        .resizable()
                        .frame(width: 66, height: 86)
                }
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

#Preview {
    NewsView()
}
