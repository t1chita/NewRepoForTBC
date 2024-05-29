//
//  HotelsView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct HotelsView: View {
    @StateObject var viewModel = HotelsViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
            .environmentObject(viewModel)
    }
}

#Preview {
    HotelsView()
}
