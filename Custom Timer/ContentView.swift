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

struct ContentView: View {
    let timerObject = TimerObject(timerColor: .red, length: 10)
    let timerObject2 = TimerObject(timerColor: .green, length: 70)
    let timerObject3 = TimerObject(timerColor: .blue, length: 20)
    var body: some View {
        VStack {
            HStack {
                TimerView(timerObject: timerObject, controls: true)
                TimerView(timerObject: timerObject2, controls: true)
            }
            TimerView(timerObject: timerObject3, controls: true)
                .frame(width: 300)
        }
        .onAppear {
            Task {
                try await Task.sleep(for: .seconds(5))
                timerObject3.startTimer()
            }
        }
    }
}

#Preview {
    ContentView()
}
