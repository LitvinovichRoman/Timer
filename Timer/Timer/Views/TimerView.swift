//
//  TimerView.swift
//  Timer
//
//  Created by Roman Litvinovich on 18/12/2023.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hello, \(user.name)!")
                .font(.title)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            StartButtonView()
                .offset(x: 0, y: -50)
                .environmentObject(timer)
            
            Spacer()
            
            LogoutButton {
                
            }
        }
        .padding()
    }
}

struct StartButtonView: View {
    @EnvironmentObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct LogoutButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
                .background(Color.yellow)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 4)
                )
        }
    }
}

#Preview {
    TimerView()
        .environmentObject(UserManager())
}

