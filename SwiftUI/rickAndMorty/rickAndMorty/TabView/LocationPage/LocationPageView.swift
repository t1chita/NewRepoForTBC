//
//  LocationPageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct LocationPageView: View {
    var locations: [Location]
    
    var body: some View {
        NavigationView {
            LocationList(locations: locations)
                .navigationTitle("Locations")
        }
    }
}

private struct LocationList: View {
    var locations: [Location]
    
    var body: some View {
        VStack {
            List {
                ForEach(locations, id: \.id) { location in
                    LocationRow(location: location)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .scrollContentBackground(.hidden)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

private struct LocationRow: View {
    let location: Location
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(height: 100)
            .foregroundColor(Color.cardsBackground)
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(location.name)")
                            .foregroundColor(Color.myLabel)
                        Text("Dimension: \(location.dimension)")
                            .foregroundColor(location.dimension == "unknown" ? Color.red : Color.myLabel)
                    }
                    Spacer()
                    Text("Type: \(location.type)")
                        .foregroundColor(Color.myLabel)
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -20)
    }
}

#Preview {
    ContentView()
}
