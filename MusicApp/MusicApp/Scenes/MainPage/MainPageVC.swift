//
//  ViewController.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import UIKit

class MainPageVC: UIViewController {
    //MARK: - Properties
    private let mainPageView: MainPageView
    private let mainPageViewModel: MainPageViewModel
    //MARK: - Initialization
    init(mainPageView: MainPageView, mainPageViewModel: MainPageViewModel) {
        self.mainPageView = mainPageView
        self.mainPageViewModel = mainPageViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycles
    override func loadView() {
        super.loadView()
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getViewDelegates()
    }
    
    //MARK: Setup
    private func setup() {
        updateView()
    }
    
    //MARK: View Delegates
    private func getViewDelegates() {
        mainPageView.PlayButtondelegate = self
        mainPageView.animatedButtonDelegate = self
    }
    //MARK: View And ViewModel Methods
    private func updateView() {
        mainPageView.artistName.text = mainPageViewModel.artistName
        mainPageView.songName.text = mainPageViewModel.songName
    }
    
}

//MARK: Play And Pause Delegate
extension MainPageVC: PlayButtonDelegate {
    func buttonTapped() {
        let musicisPlaying: Bool = mainPageView.musicProgressBar.progress > 0 && mainPageView.playButton.imageView?.image == UIImage(systemName: "play.circle.fill")
        let musicHasNotStarted: Bool = mainPageView.musicProgressBar.progress == 0
        if musicHasNotStarted {
            startMusic()
        } else if musicisPlaying {
            resumeTimer()
        } else {
            pauseMusic()
        }
    }
    
    private func startMusic() {
        mainPageView.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        mainPageViewModel.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            handleScheduledTimer()
        }
    }
    
    private func pauseMusic() {
        mainPageViewModel.timer.invalidate()
        mainPageView.playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        scaleImageAfterPause(for: mainPageView.albumImage)
    }
    
    private func resumeTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){ [weak self] in
            guard let self = self else { return }
            mainPageView.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            mainPageViewModel.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                handleScheduledTimer()
            }
            mainPageView.spinningCircleView.isHidden = true
            scaleImageAfterResume(for: mainPageView.albumImage)
        }
        animateSpinningCircle()
    }
    
    private func handleScheduledTimer() {
        mainPageViewModel.currentTime += 1
        mainPageView.durationLabel.text = mainPageViewModel.timeString(for: mainPageViewModel.currentTime)
        let progress = Float(mainPageViewModel.currentTime) / Float(mainPageViewModel.totalTime)
        mainPageView.musicProgressBar.setProgress(progress, animated: true)
        mainPageViewModel.compareTime()
    }
    
    private func animateSpinningCircle() {
        mainPageView.spinningCircleView.animate()
        mainPageView.spinningCircleView.isHidden = false
    }
    
    private func scaleImageAfterPause(for image: UIImageView) {
        UIView.animate(withDuration: 1) {
            image.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    private func scaleImageAfterResume(for image: UIImageView) {
        UIView.animate(withDuration: 1) {
            image.transform = .identity
        }
    }
}

//MARK: Pages' Animated Buttons' Delegate
extension MainPageVC: AnimatedButtonDelegate {
    func animatedButtonTapped(_ sender: UIButton?) {
        guard let unwrappedButton = sender else { return }
        scaleButton(for: unwrappedButton)
    }
    private func scaleButton(for button: UIButton) {
        let buttonImage = button.currentImage?.withTintColor(.blue, renderingMode: .alwaysOriginal)
        let buttonImageWhiteHome = mainPageView.homeButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let buttonImageWhiteFavourite = mainPageView.favouriteButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let buttonImageWhiteMusic = mainPageView.musicButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        UIView.animate(withDuration: 1, animations: {
            button.setImage(buttonImage, for: .normal)
            button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { [weak self] _ in
            guard let self = self else { return }
            if mainPageView.homeButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) ||
                mainPageView.favouriteButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) ||
                mainPageView.musicButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) {
                UIView.animate(withDuration: 1) { [weak self] in
                    guard let self = self else { return }
                    mainPageView.homeButton.transform = .identity
                    mainPageView.homeButton.setImage(buttonImageWhiteHome, for: .normal)
                    mainPageView.favouriteButton.transform = .identity
                    mainPageView.favouriteButton.setImage(buttonImageWhiteFavourite, for: .normal)
                    mainPageView.musicButton.transform = .identity
                    mainPageView.musicButton.setImage(buttonImageWhiteMusic, for: .normal)
                    button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    button.setImage(buttonImage, for: .normal)
                }
            }
        }
    }
}
