//
//  MusicView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct MusicView: View {
    @State var title: String = "We love property wrappers and closures"
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Button(action: {
                        title = "ჩვენ გვიყვარს ოთარ რამიშვილი"
                    }, label: {
                        Image("MicImage")
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    
                    Text("ჯუზონები და რამე")
                        .foregroundColor(.white)
                        .frame(width: 87, height: 13)
                        .font(.system(size: 9, weight: .regular))
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
                Image("GuitarImage")
                    .resizable()
                    .frame(width: 82, height: 182)
                    .padding(EdgeInsets(top: 50, leading: 80, bottom: 0, trailing: 0))
                Text(title)
                    .foregroundColor(.white)
                    .frame(width: 130, height: 88)
                    .font(.system(size: 17, weight: .bold))
                    .lineLimit(19)
                    .padding(EdgeInsets(top: 111, leading: 0, bottom: 33, trailing: 20))
        }
        .background(Color.musicBackground)
    }
}

#Preview {
    ContentView()
}
