//
//  MainPageView.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import UIKit

protocol PlayButtonDelegate: AnyObject {
    func buttonTapped()
}

protocol AnimatedButtonDelegate: AnyObject {
    func animatedButtonTapped(_ sender: UIButton?)
}
class MainPageView: UIView {
    let spinningCircleView = SpinningCircleView()
    //MARK: - UIComponents
     let albumImage: UIImageView = {
        let iv = UIImageView()
        iv.image = .ramishvili
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let songInfoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
     let songName: UILabel = {
        let lb = UILabel()
        lb.textColor = .label
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return lb
    }()
    
     let artistName: UILabel = {
        let lb = UILabel()
        lb.textColor = .artistNameLabel
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
     let musicProgressBar: UIProgressView = {
        let pv = UIProgressView()
        pv.trackTintColor = .gray
        pv.progressTintColor = .systemBlue
        pv.setProgress(0, animated: false)
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    private let buttonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.spacing = 39.96
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let shuffleImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "shuffle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return iv
    }()
    
    private let backwardEndImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "backward.end")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return iv
    }()
    
     let playButton: PageNavigationButton = {
        let bttn = PageNavigationButton()
        bttn.setImage(UIImage(systemName: "play.circle.fill" ), for: .normal)
        bttn.heightAnchor.constraint(equalToConstant: 74).isActive = true
        return bttn
    }()
    
    private let forwardEndImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "forward.end")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return iv
    }()
    
    private let repeatImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "repeat")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iv.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return iv
    }()
    
     let durationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "0:00"
        lb.textColor = .label
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private let containerView: UIView = {
        let uv = UIView()
        uv.backgroundColor = .container
        uv.clipsToBounds = true
        uv.layer.cornerRadius = 40
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    private let containersStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let homeButton: PageNavigationButton = {
        let bttn = PageNavigationButton()
        bttn.setImage(UIImage(systemName: "house" )?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
     let musicButton: PageNavigationButton = {
        let bttn = PageNavigationButton()
        bttn.setImage(UIImage(systemName: "music.quarternote.3" )?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
     let favouriteButton: PageNavigationButton = {
        let bttn = PageNavigationButton()
        bttn.setImage(UIImage(systemName: "heart" )?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
    //MARK: Delegates
    weak var PlayButtondelegate: PlayButtonDelegate?
    weak var animatedButtonDelegate: AnimatedButtonDelegate?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI Components
    private func setUp() {
        backgroundColor = .darkGray
        setAlbumImage()
        setSongInfoStackView()
        setMusicProgressBar()
        setSpinningCircleView()
        setButtonsStackView()
        setDurationLabel()
        setContainerView()
    }
    
    private func setAlbumImage() {
        addSubview(albumImage)
        setConstraintsToAlbumImage()
    }
    
    private func setSpinningCircleView() {
        addSubview(spinningCircleView)
        setConstraintsToSpinningCircleView()
        spinningCircleView.isHidden = true
        spinningCircleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setSongInfoStackView() {
        addSubview(songInfoStackView)
        setConstraintsToSongInfoStackView()
        songInfoStackView.addArrangedSubview(songName)
        songInfoStackView.addArrangedSubview(artistName)
    }
    
    private func setMusicProgressBar() {
        addSubview(musicProgressBar)
        setConstraintsToMusicProgressBar()
    }

    private func setButtonsStackView() {
        addSubview(buttonsStackView)
        setConstraintsToButtonsStackView()
        buttonsStackView.addArrangedSubview(shuffleImage)
        buttonsStackView.addArrangedSubview(backwardEndImage)
        buttonsStackView.addArrangedSubview(playButton)
        buttonsStackView.addArrangedSubview(forwardEndImage)
        buttonsStackView.addArrangedSubview(repeatImage)
        
        playButton.addAction(UIAction(title: "Play Music", handler: { [weak self] _ in
            self?.PlayButtondelegate?.buttonTapped()
        }), for: .touchUpInside)
//        playButton.heightAnchor.constraint(equalToConstant: 74).isActive = true
    }
    
    private func setDurationLabel() {
        addSubview(durationLabel)
        setConstraintsToDurationLabel()
    }
    
    private func setContainerView() {
        addSubview(containerView)
        setConstraintsToContainerView()
        setContainerStackView()
    }
    
    private func setContainerStackView() {
        containerView.addSubview(containersStackView)
        setConstraintsToContainersStackView()
        
        containersStackView.addArrangedSubview(homeButton)
        homeButton.addAction(UIAction(title: "Scale Button", handler: { [weak self] _ in
            self?.animatedButtonDelegate?.animatedButtonTapped(self?.homeButton)
        }), for: .touchUpInside)
        
        containersStackView.addArrangedSubview(musicButton)
        musicButton.addAction(UIAction(title: "Scale Button", handler: { [weak self] _ in
            self?.animatedButtonDelegate?.animatedButtonTapped(self?.musicButton)
        }), for: .touchUpInside)
        
        containersStackView.addArrangedSubview(favouriteButton)
        favouriteButton.addAction(UIAction(title: "Scale Button", handler: { [weak self] _ in
            self?.animatedButtonDelegate?.animatedButtonTapped(self?.favouriteButton)
        }), for: .touchUpInside)
    }
    
    //MARK: - Set Constrainst To UI Components
    private func setConstraintsToAlbumImage() {
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            albumImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            albumImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            albumImage.heightAnchor.constraint(equalToConstant: 319),
        ])
    }
    
    private func setConstraintsToSpinningCircleView() {
        NSLayoutConstraint.activate([
            spinningCircleView.topAnchor.constraint(equalTo: songInfoStackView.topAnchor, constant: -70),
            spinningCircleView.centerXAnchor.constraint(equalTo: albumImage.centerXAnchor),
            spinningCircleView.widthAnchor.constraint(equalToConstant: 56),
            spinningCircleView.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func setConstraintsToSongInfoStackView() {
        NSLayoutConstraint.activate([
            songInfoStackView.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 34),
            songInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),
            songInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65),
            songInfoStackView.heightAnchor.constraint(equalToConstant: 63),
        ])
    }

    private func setConstraintsToMusicProgressBar() {
        NSLayoutConstraint.activate([
            musicProgressBar.topAnchor.constraint(equalTo: songInfoStackView.bottomAnchor, constant: 34),
            musicProgressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            musicProgressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            musicProgressBar.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
    
    private func setConstraintsToButtonsStackView() {
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: musicProgressBar.bottomAnchor, constant: 34),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 74),
        ])
    }
    
    private func setConstraintsToDurationLabel() {
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: musicProgressBar.bottomAnchor, constant: 10),
            durationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            durationLabel.heightAnchor.constraint(equalToConstant: 19),
            durationLabel.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
    private func setConstraintsToContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 40),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 50)
        ])
    }
    
    private func setConstraintsToContainersStackView() {
        NSLayoutConstraint.activate([
            containersStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 23),
            containersStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
            containersStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38),
            containersStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -88)
        ])
    }
}


