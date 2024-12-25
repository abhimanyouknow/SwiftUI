//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        // step 1: make an instance of type LAContect
        let context = LAContext()
        var error: NSError?
        
        // step 2: check if biometric auth is possible or not
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            // step 3: if yes, kick off actual request for auth
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // step 4: whether user was authenticated or not, the completion code is called telling us whether it worked or not
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    ContentView()
}
