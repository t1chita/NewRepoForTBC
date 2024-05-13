//
//  Protocols.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 14.05.24.
//

import UIKit

protocol PlayButtonTappedChildDelegates: AnyObject {
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

protocol RepeatButtonTappedChildDelegates: AnyObject {
    func restartProgressBarAndDuration()
//    func handleScheduledTimerAfterRepeat()
}

protocol PlaylistButtonsDelegate: AnyObject {
    func playButtonTapped()
    func repeatButtonTapped()
}

protocol AnimatedButtonDelegate: AnyObject {
    func animatedButtonTapped(_ sender: UIButton?)
}
