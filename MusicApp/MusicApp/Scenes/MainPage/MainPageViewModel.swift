//
//  MainPageViewModel.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//
import AVFoundation
import Foundation

final class MainPageViewModel {
    let songName: String = "თბილისო"
    let artistName: String = "ოთარ რამიშვილი"
    private var timer = Timer()
    var currentTime = 0
    let totalTime = 133
    
    var player: AVAudioPlayer?
    
    weak var playButtonTappedChildDelegates: PlayButtonTappedChildDelegates?
    weak var musicConditionDelegates: MusicConditionDelegates?
    weak var repeatButtonTappedChildDelegates: RepeatButtonTappedChildDelegates?
    
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
    func handlePlayButtonTapped() {
        guard let unwrappedHasNotStarted = musicConditionDelegates?.musicHasNotStarted  else { return }
        guard let unwrappedIsPlaying = musicConditionDelegates?.musicisPlaying  else { return }
        
        if unwrappedHasNotStarted {
            startMusic()
        } else if unwrappedIsPlaying {
            resumeTimer()
        } else {
            pauseMusic()
        }
    }
    
    private func startMusic() {
        startMusicPlayer()
        playButtonTappedChildDelegates?.changedPauseButton()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            playButtonTappedChildDelegates?.handleScheduledTimer()
        }
    }
    
    private func pauseMusic() {
        timer.invalidate()
        player?.pause()
        playButtonTappedChildDelegates?.changedPlayButton()
        playButtonTappedChildDelegates?.scaleImageAfterPause()
    }
    
    private func resumeTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){ [weak self] in
            guard let self = self else { return }
            playButtonTappedChildDelegates?.changedPauseButton()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                playButtonTappedChildDelegates?.handleScheduledTimer()
            }
            playButtonTappedChildDelegates?.hideSpinningCircle()
            playButtonTappedChildDelegates?.scaleImageAfterResume()
            player?.play()
        }
        playButtonTappedChildDelegates?.animateSpinningCircle()
    }
    
    private func startMusicPlayer() {
        let urlStringOfMusic = Bundle.main.path(forResource: "ოთარ რამიშვილი - თბილისო (1988)", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlStringOfMusic = urlStringOfMusic else { return }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlStringOfMusic))
            player?.play()
        }
        catch {
            print("something went wrong")
        }
    }
}


//MARK: Handle Pause And Play Actions Extensions
extension MainPageViewModel {
    func handleRepeatButtonTapped() {
        guard let unwrappedHasNotStarted = musicConditionDelegates?.musicHasNotStarted  else { return }
        
        if !unwrappedHasNotStarted {
            repeatMusic()
        } else if unwrappedHasNotStarted {
            pauseMusic()
        }
    }
    
    private func repeatMusic() {
        timer.invalidate()
        playButtonTappedChildDelegates?.scaleImageAfterResume()
        repeatButtonTappedChildDelegates?.restartProgressBarAndDuration()
        startMusic()
    }
}
