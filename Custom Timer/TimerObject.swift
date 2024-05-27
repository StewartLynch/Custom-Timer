//
// Created for Custom Timer
// by  Stewart Lynch on 2024-05-26
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

@Observable
class TimerObject {
    let timerColor: Color
    let length: Int
    
    init(timerColor: Color, length: Int) {
        self.timerColor = timerColor
        self.length = length
    }
    
    var timer: Timer? = nil
    var timeElapsed = 0
    
    var isTimerRunning = false
    
    var remainingTime: Int {
        length - timeElapsed
    }
    
    var progress: CGFloat {
        CGFloat(length - remainingTime) / CGFloat(length)
    }
    
    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if remainingTime > 0 {
                timeElapsed += 1
            } else {
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        if isTimerRunning {
            isTimerRunning = false
            timer?.invalidate()
        }
    }
    
    func resetTimer() {
        timeElapsed = 0
        isTimerRunning = false
    }
    
    var playButtonDisabled: Bool {
        guard remainingTime > 0, !isTimerRunning else { return true}
        return false
    }
    
    var pauseButtonDisabled: Bool {
        guard remainingTime > 0, isTimerRunning else { return true }
        return false
    }
    
    var resetButtonDisabled: Bool {
        guard remainingTime != length, !isTimerRunning else { return true }
        return false
    }
}
