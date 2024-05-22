//
//  MessageView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct MessageView: View {
    @State var backgroundColor: Color = .messageBackground
    @State var backgroundChanged: Bool = false
    var body: some View {
        ZStack {
            VStack {
                    Button {
                        if !backgroundChanged {
                            backgroundColor = .purple
                            backgroundChanged = true
                        } else {
                            backgroundColor = .messageBackground
                            backgroundChanged = false
                        }
                    } label: {
                        Image(.message)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Text("ჩატაობა")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 13)
                        .font(.system(size: 9, weight: .regular))
            }
            .padding(EdgeInsets(top: 12, leading: 0, bottom: 51, trailing: 94))
                Image(.chat)
                    .resizable()
                    .frame(width: 97, height: 93)
                    .padding(EdgeInsets(top: 18, leading: 95, bottom: 0, trailing: 0))
        }
        .background(backgroundColor)
        .cornerRadius(18)
    }
}

#Preview {
    MessageView()
}
