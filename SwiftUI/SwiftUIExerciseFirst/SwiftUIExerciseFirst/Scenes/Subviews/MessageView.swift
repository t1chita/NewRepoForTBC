//
//  MessageView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct MessageView: View {
    @State var backgroundColor: Color = .messageBackground
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        backgroundColor = .purple

                    } label: {
                        Image(.message)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                HStack {
                    Text("ჩატაობა")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 13)
                        .font(.system(size: 9, weight: .regular))
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
            HStack {
                Spacer()
                Image(.chat)
                    .resizable()
                    .frame(width: 97, height: 93)
            }
            .padding(EdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    MessageView()
}
