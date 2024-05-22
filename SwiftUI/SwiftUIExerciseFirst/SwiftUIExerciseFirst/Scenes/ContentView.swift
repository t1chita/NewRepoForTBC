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
            Color.gray
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("SwiftUI Exercise")
                        .font(.system(size: 34, weight: .bold))
                        .frame(width: 308, height: 41)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: -7, bottom: 0, trailing: 0))
                    Spacer()
                }
                Spacer()
                VStack {
                    HStack {
                        HStack {
                            MusicView()
                                .frame(width: 165, height: 232)
                                .cornerRadius(18)
                                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 13))
                        }
                        VStack {
                            HStack {
                                MessageView()
                                    .frame(width: 165, height: 110)
                                    .cornerRadius(18)
                            }
                            HStack {
                                NewsView()
                                    .frame(width: 165, height: 110)
                                    .cornerRadius(18)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 23))
                    }
                    Spacer()
                    ListView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
