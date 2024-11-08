//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by C3PO MBP on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
        /* NOTE: the .shuffled() method at the end of the
         array will randomize the array everytime */
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var questionCount = 0
    @State private var showNewGame = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial) // frosted
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(scoreTitle == "Wrong" ? scoreMessage : "Great Job!") \nYour score is \(score)")
            //Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showNewGame) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your Final Score is: \(score)!")
        }
    }
    
    // method to be called when a flag is tapped
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That's the flag of \(countries[number])"
            if score > 0 {
                score -= 1
            }
        }
        
        // increase the question count
        questionCount += 1
        
        if questionCount < 8 {
            // show the alert that continues the game
            showingScore = true
        } else {
            // show the final alert
            showNewGame = true
        }
    }
    
    // method to be called when user presses 'continue'
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    // method to reset the game
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        // reset the question count & score
        questionCount = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
