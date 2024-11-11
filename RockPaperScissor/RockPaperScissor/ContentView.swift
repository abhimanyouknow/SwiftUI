//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by C3PO MBP on 11/11/24.
//

/* Possible improvements
 [] view composition for buttons
 [] enums for moves, score title
 [] UI improvements
 */

import SwiftUI

struct ContentView: View {
    @State private var moves = ["Rock", "Paper", "Scissor"]
    var movesEmoji = ["✊", "✋", "✌️"]
    @State private var currentMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = "Wrong"
    @State private var scoreMessage = ""
    
    @State private var questionCount = 0
    @State private var showNewGame = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.blue, .teal], center: .top, startRadius: 20, endRadius: 400)
            
            VStack(spacing: 20) {
                
                Spacer()
                Spacer()
                
                // display score
                Text("Score: \(score)")
                    .font(.largeTitle)
                
                Spacer()
                
                VStack(spacing: 15) {
                    // display app's move
                    Text("App's Move: \(moves[currentMove])")
                        .font(.title)
                        .foregroundStyle(.gray)
                    
                    // whether player should win/lose
                    Text("\(shouldWin ? "You have to WIN" : "You have to LOSE")")
                        .font(.headline)
                        .foregroundStyle(shouldWin ? .green : .red)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                HStack(spacing: 20) {
                    // three buttons for player's move
                    ForEach(0..<3) { number in
                        Button {
                            playerButtonTapped(number)
                        } label: {
                            Text(movesEmoji[number])
                                .font(.system(size: 75))
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.blue)
                        )
                    }
                }
                
                Spacer()
                Spacer()
            }
            .padding()
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
        // add alerts for win/lose
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: nextRound)
        } message: {
            Text("\(scoreTitle == "Correct" ? "Good job!" : scoreMessage)")
        }
        .alert("Game Over", isPresented: $showNewGame) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is: \(score)")
        }
    }
    
    // method for when player taps on a button
    func playerButtonTapped(_ number: Int) {
        if shouldWin { // if player has to win
            if currentMove == 0 { // rock
                // paper beats rock
                if number == 1 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Paper beats Rock"
                }
            } else if currentMove == 1 { // paper
                // scissor beats paper
                if number == 2 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Scissor beats Paper"
                }
            } else if currentMove == 2 { // scissor
                // rock beats scissor
                if number == 0 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Rocks beats Scissor"
                }
            }
        } else { // if player should lose
            if currentMove == 0 { // rock
                // scissor loses to rock
                if number == 2 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Scissor loses to Rock"
                }
            } else if currentMove == 1 { // paper
                // rock loses to paper
                if number == 0 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Rock loses to Ppaer"
                }
            } else if currentMove == 2 { // scissor
                // paper loses to scissor
                if number == 1 {
                    score += 1
                    scoreTitle = "Correct"
                } else {
                    score -= 1
                    scoreTitle = "Wrong"
                    scoreMessage = "Paper loses to Scissor"
                }
            }
        }
        
        shouldWin.toggle()
        
        if score < 0 { score = 0 }
        
        questionCount += 1
        
        if questionCount < 10 {
            // show the alert that continues the game
            showingScore = true
        } else {
            // show the final alert
            showNewGame = true
        }
    }
    
    // method for proceeding to next question
    func nextRound() {
        currentMove = Int.random(in: 0..<3)
    }
    
    // method for resetting the game
    func resetGame() {
        currentMove = Int.random(in: 0..<3)
                
        // reset the question count & score
        questionCount = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
