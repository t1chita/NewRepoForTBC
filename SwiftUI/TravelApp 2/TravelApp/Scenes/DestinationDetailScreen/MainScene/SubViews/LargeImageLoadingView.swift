//
//  LargeImageLoadingView.swift
//  TravelApp
//
//  Created by Temur Chitashvili on 29.05.24.
//

import SwiftUI

struct LargeImageLoadingView: View {
    @StateObject var imageLoader: ImageLoader
    
    init(url: URL) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    let imageSize: CGFloat = 100
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(5)
                    .clipped()
                    .padding(.top, 20)
            } else if imageLoader.errorMessage != nil {
                Text(imageLoader.errorMessage!)
                    .foregroundColor(.red)
                    .frame(width: imageSize, height: imageSize)
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            }
        }
        .onAppear {
            imageLoader.fetchImage()
        }
    }
}


