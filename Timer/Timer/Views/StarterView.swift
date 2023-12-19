//
//  StarterView.swift
//  Timer
//
//  Created by Roman Litvinovich on 18/12/2023.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        
        Group {
            if user.isRegister {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

#Preview {
    StarterView()
        .environmentObject(UserManager())
}
