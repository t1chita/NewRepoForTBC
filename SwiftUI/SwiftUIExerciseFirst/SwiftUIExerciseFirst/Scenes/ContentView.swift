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
            Color.white.ignoresSafeArea()
            
            VStack {
                Circle()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.blue)
                Spacer()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
