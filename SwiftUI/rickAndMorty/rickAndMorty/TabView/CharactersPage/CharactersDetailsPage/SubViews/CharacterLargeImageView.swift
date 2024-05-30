//
//  CharacterLargeImageView.swift
//  rickAndMorty
//
//  Created by Temur Chitashvili on 31.05.24.
//

import SwiftUI

struct CharacterLargeImageView: View {
    @StateObject var imageLoader: ImageLoader
    let imageSize: CGFloat = 100
    
    init(url: URL) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .cornerRadius(60)
                    .clipped()
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
