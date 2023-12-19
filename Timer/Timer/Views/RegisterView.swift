//
//  RegisterView.swift
//  Timer
//
//  Created by Roman Litvinovich on 18/12/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @AppStorage("INPUT_NAME") var inputName: String?

    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var numberOfCharacters = 0
    @State private var isInputValid = false
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Spacer(minLength: 25)
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        numberOfCharacters = newValue.count
                        updateInputState()
                    }
                
                if isInputValid { Text("\(numberOfCharacters)") }
                
                Spacer(minLength: 25)
            }
            
            if isInputValid {
                Button(action: registerUser) {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            
        }
    }
    
    private func updateInputState() {
        if !name.isEmpty && name.count <= 15 {
            isInputValid = true
        } else {
            isInputValid = false
        }
    }
    
    private func registerUser() {
        inputName = name
        user.name = inputName ?? "eeeerrrr"
        user.isRegister.toggle()
        
          
        print("\(inputName ?? "eeeerrrrr"))")
      
    }
}

#Preview {
    RegisterView()
        .environmentObject(UserManager())
}
