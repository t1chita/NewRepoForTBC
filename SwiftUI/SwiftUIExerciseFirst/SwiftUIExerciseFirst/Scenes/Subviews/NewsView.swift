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
            VStack(alignment: .leading) {
                        Button(action: {
                        }, label: {
                            Image(.person)
                                .resizable()
                                .frame(width: 32, height: 32)
                        })
                        Text("ცეცხლოვანი სიახლეები")
                            .foregroundColor(.white)
                            .frame(width: 61, height: 26)
                            .font(.system(size: 9, weight: .regular))
                            .lineLimit(2)
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 38, trailing: 88))
                    Image(.rupori)
                        .resizable()
                        .frame(width: 66, height: 86)
                .padding(EdgeInsets(top: 24, leading: 99, bottom: 0, trailing: 0))
        }
        .background(Color.newsBackground)
        .cornerRadius(18)
    }
}

#Preview {
    NewsView()
}
