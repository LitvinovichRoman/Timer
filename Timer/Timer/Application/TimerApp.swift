//
//  TimerApp.swift
//  Timer
//
//  Created by Roman Litvinovich on 18/12/2023.
//

import SwiftUI

@main

struct TimerApp: App {
    @StateObject private var user = UserManager()

    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(user)
        }
    }
}
