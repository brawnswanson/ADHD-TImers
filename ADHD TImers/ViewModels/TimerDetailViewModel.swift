//
//  TimerDetailViewModel.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//

import Foundation
import Combine


class TimerDetailViewModel: ObservableObject {
    
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    @Published var timeRemaining = 0
    
    var timerPublisher = Timer.TimerPublisher(interval: 1.0, tolerance: nil, runLoop: .current, mode: .common).autoconnect()
    
    var subscriptions = Set<AnyCancellable>()
    
    func startTimer() {
        let totalTime = hours * 60 * 60 + minutes * 60 + seconds
        timeRemaining = totalTime
        
        timerPublisher = Timer.TimerPublisher(interval: 1.0, tolerance: nil, runLoop: .current, mode: .common).autoconnect()
        
        timerPublisher
            .print()
            .sink(receiveValue: { _ in
                guard self.timeRemaining > 0 else {
                    self.timerPublisher.upstream.connect().cancel()
                    return
                }
                self.timeRemaining -= 1 })
            .store(in: &subscriptions)
    }
}
