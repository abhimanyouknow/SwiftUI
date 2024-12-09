//
//  ContentView.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
        /* had we used @State, then isOn would have gotten
         the initial value from the ContentView struct
         property 'rememberMe', but then PushButton view
         struct would have toggled the value of isOn in
         isolation to rememberMe.
         
         since we want both properties, rememberMe and isOn
         to reflect the same boolean value, we're using the
         @Binding property wrapper - now there is a two-way
         binding between rememberMe & isOn across the two
         views.
         */
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        PushButton(title: "Remember Me", isOn: $rememberMe)
        Text(rememberMe ? "On" : "Off")
    }
}

#Preview {
    ContentView()
}
