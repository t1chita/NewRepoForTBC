//
//  ViewController.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import UIKit
protocol ButtonTappedChildDelegates: AnyObject {
    func scaleImageAfterResume()
    func scaleImageAfterPause()
    func animateSpinningCircle()
    func handleScheduledTimer()
    func hideSpinningCircle()
    func changedPlayButton()
    func changedPauseButton()
}

protocol MusicConditionDelegates: AnyObject {
    var musicisPlaying: Bool { get }
    var musicHasNotStarted: Bool { get }
}

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
        mainPageViewModel.buttonTappedChildDelegates = self
        mainPageViewModel.musicConditionDelegates = self
    }
    
    //MARK: View And ViewModel Methods
    private func updateView() {
        mainPageView.artistName.text = mainPageViewModel.artistName
        mainPageView.songName.text = mainPageViewModel.songName
    }
}

//MARK: Play And Pause Delegate
extension MainPageVC: PlayButtonDelegate, ButtonTappedChildDelegates, MusicConditionDelegates {
    var musicisPlaying: Bool {
        get {
            mainPageView.musicProgressBar.progress > 0 && mainPageView.playButton.imageView?.image == UIImage(systemName: "play.circle.fill")
        }
    }
    var musicHasNotStarted: Bool {
        get {
            mainPageView.musicProgressBar.progress == 0
        }
    }
    
    func buttonTapped() {
        mainPageViewModel.handleButtonTapped()
    }
    
    func changedPlayButton() {
        mainPageView.playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
    }
    
    func changedPauseButton() {
        mainPageView.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
    }
    
    func hideSpinningCircle() {
        mainPageView.spinningCircleView.isHidden = true
    }
    
    func animateSpinningCircle() {
        mainPageView.spinningCircleView.animate()
        mainPageView.spinningCircleView.isHidden = false
    }
    
    func handleScheduledTimer() {
        mainPageViewModel.currentTime += 1
        mainPageView.durationLabel.text = mainPageViewModel.timeString(for: mainPageViewModel.currentTime)
        let progress = Float(mainPageViewModel.currentTime) / Float(mainPageViewModel.totalTime)
        mainPageView.musicProgressBar.setProgress(progress, animated: true)
        mainPageViewModel.compareTime()
    }
    
    func scaleImageAfterPause() {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.mainPageView.albumImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
    }
    func scaleImageAfterResume() {
        UIView.animate(withDuration: 1) { [weak self] in
            self?.mainPageView.albumImage.transform = .identity
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
        guard let unwrappedButtonImage = buttonImage else { return }
        transformAllButtonAfterSelection(button, unwrappedButtonImage: unwrappedButtonImage)
    }
    
    private func transformAllButtonAfterSelection(_ selectedButton: UIButton, unwrappedButtonImage: UIImage) {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self = self else { return }
            
            transformSelectedButton(selectedButton, buttonImage: unwrappedButtonImage)
        }) { [weak self] _ in
            guard let self = self else { return }
            
            if isButtonsSizeTransformed() {
                UIView.animate(withDuration: 1) { [weak self] in
                    guard let self = self else { return }
                    transformTwoButtonToIdentity()
                    transformSelectedButton(selectedButton, buttonImage: unwrappedButtonImage)
                }
            }
        }
    }
    
    private func isButtonsSizeTransformed() -> Bool {
        if  mainPageView.homeButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) ||
            mainPageView.favouriteButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) ||
            mainPageView.musicButton.transform == CGAffineTransform(scaleX: 1.5, y: 1.5) {
            return true
        }
        return false
    }
    
    private func transformSelectedButton(_ button: UIButton, buttonImage: UIImage) {
        button.setImage(buttonImage, for: .normal)
        button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    
    private func transformTwoButtonToIdentity() {
        let buttonImageWhiteHome = mainPageView.homeButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let buttonImageWhiteMusic = mainPageView.musicButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let buttonImageWhiteFavourite = mainPageView.favouriteButton.currentImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        navigButtonTransformAfterSelectOne(for:  mainPageView.homeButton, with: buttonImageWhiteHome)
        navigButtonTransformAfterSelectOne(for:  mainPageView.musicButton, with: buttonImageWhiteMusic)
        navigButtonTransformAfterSelectOne(for:  mainPageView.favouriteButton, with: buttonImageWhiteFavourite)
    }
    
    private func navigButtonTransformAfterSelectOne(for button: UIButton, with image: UIImage?) {
        button.transform = .identity
        button.setImage(image, for: .normal)
    }
}
