//
//  ContentView.swift
//  SwiftUIExerciseFirst
//
//  Created by Temur Chitashvili on 22.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                    Text("SwiftUI Exercise")
                        .font(.system(size: 34, weight: .bold))
                        .frame(width: 308, height: 41)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 6.9, leading: 9, bottom: 0, trailing: 90))
                    HStack {
                            MusicView()
                                .frame(width: 165, height: 232)
                                .cornerRadius(18)
                                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 13))
                        VStack {
                                MessageView()
                                    .frame(width: 165, height: 110)
                                    .cornerRadius(18)
                                NewsView()
                                    .frame(width: 165, height: 110)
                                    .cornerRadius(18)
                        }
                      }
                    .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 23))
                ListView()
                    .padding(EdgeInsets(top: 0, leading: -40, bottom: 0, trailing: -11))
            }
        }
        .background(Color.background)
    }
}

#Preview {
    ContentView()
}
