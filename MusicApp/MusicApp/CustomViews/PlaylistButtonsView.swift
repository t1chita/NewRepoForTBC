//
//  PlaylistButtonsView.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 14.05.24.
//

import UIKit

final class PlaylistButtonsView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        imageView?.contentMode = .scaleToFill
        contentMode = .scaleAspectFill
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 25).isActive = true
        widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
