//
//  TabView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 30.05.24.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            CharactersPageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
        }
        .accentColor(.myLabel)
    }
}

#Preview {
    MyTabView()
}
