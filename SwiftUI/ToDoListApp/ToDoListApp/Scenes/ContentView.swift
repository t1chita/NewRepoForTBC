//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Temur Chitashvili on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAllTaskCompleted = false
    @State var completedCounter: CGFloat = 0
    @State var incompletedCounter: CGFloat = 6
    @State var percent: CGFloat = 0
    var body: some View {
        ZStack {
            VStack {
                HeaderView(incompletedCounterBadge: $incompletedCounter, incompletedCounter: $incompletedCounter, isAllTaskCompleted: $isAllTaskCompleted)
                ScrollView {
                    ProgressBarView(counter: $completedCounter,width: 340, heigth: 20, percent: percent)
                        .frame(width: 380, height: 139)
                        .padding(EdgeInsets(top: 39, leading: 16, bottom: 0, trailing: 16))
                    ListView(isAllTaskCompleted: $isAllTaskCompleted, completedCounter: $completedCounter, incompletedCounter: $incompletedCounter, percent: $percent)
                        .frame(width: 400)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .background {
                Color.fullBackground
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
}
