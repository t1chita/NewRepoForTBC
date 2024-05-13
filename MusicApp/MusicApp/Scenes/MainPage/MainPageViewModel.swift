//
//  MainPageViewModel.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import Foundation

final class MainPageViewModel {
    let songName: String = "თბილისო"
    let artistName: String = "ოთარ რამიშვილი"
    private var timer = Timer()
    var currentTime = 0
    let totalTime = 133
    
    weak var buttonTappedChildDelegates: ButtonTappedChildDelegates?
    weak var musicConditionDelegates: MusicConditionDelegates?
    
    //TODO: დაარესერჩე კარგად String(format:)
    func timeString(for seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
    func compareTime() {
        if currentTime >= totalTime {
            timer.invalidate()
        }
    }
}

//MARK: Handle Pause And Play Actions Extensions
extension MainPageViewModel {
    func handleButtonTapped() {
        guard let unwrappedHasNotStarted = musicConditionDelegates?.musicHasNotStarted  else { return }
        guard let unwrappedIsPlaying = musicConditionDelegates?.musicisPlaying  else { return }
        
        
        if unwrappedHasNotStarted{
            startMusic()
        } else if unwrappedIsPlaying {
            resumeTimer()
        } else {
            pauseMusic()
        }
    }
    
    private func startMusic() {
        buttonTappedChildDelegates?.changedPauseButton()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            buttonTappedChildDelegates?.handleScheduledTimer()
        }
    }
    
    private func pauseMusic() {
        timer.invalidate()
        buttonTappedChildDelegates?.changedPlayButton()
        buttonTappedChildDelegates?.scaleImageAfterPause()
    }
    
    private func resumeTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){ [weak self] in
            guard let self = self else { return }
            buttonTappedChildDelegates?.changedPauseButton()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                buttonTappedChildDelegates?.handleScheduledTimer()
            }
            buttonTappedChildDelegates?.hideSpinningCircle()
            buttonTappedChildDelegates?.scaleImageAfterResume()
        }
        buttonTappedChildDelegates?.animateSpinningCircle()
    }
}
