//
//  MainPageViewModel.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 10.05.24.
//

import Foundation

class MainPageViewModel {
    let songName: String = "თბილისო"
    let artistName: String = "ოთარ რამიშვილი"
    var timer = Timer()
    var currentTime = 0
    let totalTime = 133

    
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
