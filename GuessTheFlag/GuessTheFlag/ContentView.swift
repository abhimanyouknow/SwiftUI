//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by C3PO MBP on 06/11/24.
//

import SwiftUI

// project 3 - challenge 2
// custom view used for view composition
struct AddImage: View {
    var country: String
    
    init(of country: String) {
        self.country = country
    }
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

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
    
    // project 6 - challenge 1, 2, 3 - part 1
    @State private var rotationAmount = [0.0, 0.0, 0.0]
    @State private var opacityAmount = [1.0, 1.0, 1.0]
    @State private var scaleAmount = [1.0, 1.0, 1.0]
    
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
                            AddImage(of: countries[number]) // project 3 - challenge 2
                                /* NOTE: using view
                                 composition by calling newly
                                 defined custom view which
                                 applies modifiers to each
                                 input */
                        }
                        // project 6 - challenge 1 - part 2
                        .rotation3DEffect(.degrees(rotationAmount[number]), axis: (x: 0, y: 1, z: 0))
                        
                        // project 6 - challenge 2 - part 2
                        .opacity(opacityAmount[number])
                        
                        // project 6 - challenge 3 - part 3
                        .scaleEffect(scaleAmount[number])
                        .animation(.default, value: scaleAmount[number])
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
            
            // project 6 - challenge 1 - part 3
            // only rotate the correct flag
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                rotationAmount[number] += 180
            }
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
        
        // project 6 - challenge 2, 3 - part 3
        withAnimation {
            for i in 0..<opacityAmount.count {
                // decreasing opacity of other flags
                opacityAmount[i] = i == number ? 1.0 : 0.25
                
                // decreasing scale of other flags
                scaleAmount[i] = i == number ? 1.0 : 0.75
            }
        }
    }
    
    // method to be called when user presses 'continue'
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        // project 6 - challenge 2, 3 - part 4
        withAnimation {
            // resetting the opacity of all the flags
            opacityAmount = [1.0, 1.0, 1.0]
            
            // resetting scale of all flags
            scaleAmount = [1.0, 1.0, 1.0]
        }
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
