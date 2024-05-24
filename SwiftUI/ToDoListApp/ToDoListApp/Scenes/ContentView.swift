//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView()
                ScrollView {
                    ProgressBar()
                        .frame(maxWidth: .infinity, maxHeight: 179)
                        .padding(EdgeInsets(top: 19, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
