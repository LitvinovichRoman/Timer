//
//  TimeCounter.swift
//  Timer
//
//  Created by Roman Litvinovich on 18/12/2023.
//

import Combine
import Foundation

class TimeCounter: ObservableObject {
    
    private var buttonState: ButtonState = .start
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer? = nil
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0, timer == nil {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.updateCounter()
            }
        }
        
        buttonUIStateUpdate()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

extension TimeCounter {
    
    enum ButtonState {
        case start
        case wait
        case reset
        
        mutating func nextState() {
            switch self {
            case .start:
                self = .wait
            case .wait:
                self = .reset
            case .reset:
                self = .start
            }
        }
    }
    
    private func buttonUIStateUpdate() {
         buttonState.nextState()

         switch buttonState {
         case .start:
             counter = 3
             buttonTitle = "Start"
         case .wait:
             buttonTitle = "Wait..."
         case .reset:
             buttonTitle = "Reset"
         }

         objectWillChange.send(self)
     }
}
