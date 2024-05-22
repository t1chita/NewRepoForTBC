//
//  MusicCell.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 16.05.24.
//

import UIKit

class MusicCell: UICollectionViewCell {
    static let identifier = "MusicCell"
    //MARK: - UIComponents
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songInfoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let songName: UILabel = {
        let lb = UILabel()
        lb.textColor = .label
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return lb
    }()
    
    private let artistName: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .artistNameLabel
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configure(imageUrl: String?, artist: String?, songName: String?) {
        guard
            let unwrapedImageUrl = imageUrl,
            let unwrapedArtist = artist,
            let unwrapedSongName = songName else { return }
            
        guard let url = URL(string: unwrapedImageUrl) else { return }
        imageView.loadImage(from: url)
        self.songName.text = unwrapedSongName
        self.artistName.text = unwrapedArtist
        
    }
    
    //MARK: - Setup UI Components
    private func setupUI() {
        setImageView()
        setSongInfoStackView()
        clipsToBounds = true
    }
    
    private func setImageView() {
        addSubview(imageView)
        setConstraintsToImageView()
    }
    
    private func setSongInfoStackView() {
        addSubview(songInfoStackView)
        setConstraintsToSongInfoStackView()
        songInfoStackView.addArrangedSubview(songName)
        songInfoStackView.addArrangedSubview(artistName)
    }
    
    
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToImageView() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34 - 63),
        ])
    }
    
    private func setConstraintsToSongInfoStackView() {
        NSLayoutConstraint.activate([
            songInfoStackView.topAnchor.constraint(equalTo: bottomAnchor),
            songInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            songInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            songInfoStackView.heightAnchor.constraint(equalToConstant: 63),
        ])
    }
}
