//
//  MainPageView.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import UIKit

final class MainPageView: UIView {
    let spinningCircleView = SpinningCircleView()
    //MARK: - UIComponents
     let musicCollectionView: UICollectionView = {
         let collectionViewFlowLayout = UICollectionViewFlowLayout()
         collectionViewFlowLayout.scrollDirection = .horizontal
         collectionViewFlowLayout.minimumLineSpacing = 0
         collectionViewFlowLayout.minimumInteritemSpacing = 0
         let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewFlowLayout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.register(MusicCell.self, forCellWithReuseIdentifier: MusicCell.identifier)
         collectionView.backgroundColor = .clear
         collectionView.isPagingEnabled = false
         return collectionView
    }()
    
    let musicProgressBar: UIProgressView = {
        let pv = UIProgressView()
        pv.trackTintColor = .gray
        pv.progressTintColor = .systemBlue
         pv.setProgress(0, animated: false)
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    private let playlistButtonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 39.96
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let shuffleButton: PlaylistButtonsView = {
        let bttn = PlaylistButtonsView()
        bttn.setImage(UIImage(systemName: "shuffle")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
    private let backwardEndButton: PlaylistButtonsView = {
        let bttn = PlaylistButtonsView()
        bttn.setImage(UIImage(systemName: "backward.end")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
     let playButton: PageNavigationButton = {
        let bttn = PageNavigationButton()
        bttn.setImage(UIImage(systemName: "play.circle.fill" ), for: .normal)
        bttn.heightAnchor.constraint(equalToConstant: 74).isActive = true
        return bttn
    }()
    
    private let forwardEndButton: PlaylistButtonsView = {
        let bttn = PlaylistButtonsView()
        bttn.setImage(UIImage(systemName: "forward.end")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
    }()
    
    private let repeatButton: PlaylistButtonsView = {
        let bttn = PlaylistButtonsView()
        bttn.setImage(UIImage(systemName: "repeat")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        return bttn
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
        uv.clipsToBounds = true
        uv.layer.cornerRadius = 40
        uv.backgroundColor = .container
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
    weak var playlistButtonsDelegate: PlaylistButtonsDelegate?
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
//        setSongInfoStackView()
        setMusicProgressBar()
        setSpinningCircleView()
        setButtonsStackView()
        setDurationLabel()
        setContainerView()
    }
    
    private func setAlbumImage() {
        addSubview(musicCollectionView)
        setConstraintsToAlbumImage()
    }
    
    private func setSpinningCircleView() {
        addSubview(spinningCircleView)
        setConstraintsToSpinningCircleView()
        spinningCircleView.isHidden = true
        spinningCircleView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setMusicProgressBar() {
        addSubview(musicProgressBar)
        setConstraintsToMusicProgressBar()
    }

    private func setButtonsStackView() {
        addSubview(playlistButtonsStackView)
        setConstraintsToButtonsStackView()
        playlistButtonsStackView.addArrangedSubview(shuffleButton)
        playlistButtonsStackView.addArrangedSubview(backwardEndButton)
        playlistButtonsStackView.addArrangedSubview(playButton)
        playlistButtonsStackView.addArrangedSubview(forwardEndButton)
        playlistButtonsStackView.addArrangedSubview(repeatButton)
        
        playButton.addAction(UIAction(title: "Play Music", handler: { [weak self] _ in
            self?.playlistButtonsDelegate?.playButtonTapped()
        }), for: .touchUpInside)
        
        repeatButton.addAction(UIAction(title: "Repeat Music", handler: { [weak self] _ in
            self?.playlistButtonsDelegate?.repeatButtonTapped()
        }), for: .touchUpInside)
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
            musicCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            musicCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            musicCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            musicCollectionView.heightAnchor.constraint(equalToConstant: 319),
        ])
    }
    
    private func setConstraintsToSpinningCircleView() {
        NSLayoutConstraint.activate([
            spinningCircleView.topAnchor.constraint(equalTo: musicProgressBar.topAnchor, constant: -112),
            spinningCircleView.centerXAnchor.constraint(equalTo: musicCollectionView.centerXAnchor),
            spinningCircleView.widthAnchor.constraint(equalToConstant: 56),
            spinningCircleView.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    private func setConstraintsToMusicProgressBar() {
        NSLayoutConstraint.activate([
            musicProgressBar.topAnchor.constraint(equalTo: musicCollectionView.bottomAnchor, constant: 34),
            musicProgressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            musicProgressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            musicProgressBar.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
    
    private func setConstraintsToButtonsStackView() {
        NSLayoutConstraint.activate([
            playlistButtonsStackView.topAnchor.constraint(equalTo: musicProgressBar.bottomAnchor, constant: 34),
            playlistButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            playlistButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            playlistButtonsStackView.heightAnchor.constraint(equalToConstant: 74),
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
            containerView.topAnchor.constraint(equalTo: playlistButtonsStackView.bottomAnchor, constant: 40),
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


