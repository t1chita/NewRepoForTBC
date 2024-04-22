//
//  UIImageView.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 21.04.24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.sync{
                self?.image = image
            }
        }.resume()
    }
}
