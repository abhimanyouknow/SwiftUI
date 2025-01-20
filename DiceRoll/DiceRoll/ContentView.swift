//
//  ContentView.swift
//  DiceRoll
//
//  Created by C3PO MBP on 20/01/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var scores: [Score]
    
    @State private var rollResult: Int = 0
    
    let numberOfDice = [1, 2, 3]
    @State private var selectedNoOfDice = 1
    
    let numberOfSides = [4, 6, 8, 10, 12, 20, 100]
    @State private var selectedNoOfSides = 6
    
    @State private var currentRollResults = [Int]()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Roll Result")
                        .font(.title2)
                        .padding(.top)
                    
                    Text(String(rollResult))
                        .font(.system(size: 70))
                    
                    if currentRollResults.isEmpty == false && currentRollResults.count > 1 {
                        HStack {
                            Text("(")
                            
                            ForEach(currentRollResults, id: \.self) {
                                Text(String($0))
                            }
                            
                            Text(")")
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Settings")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Text("Number of dice")
                        
                        Spacer()
                        
                        Picker("Select number of dice", selection: $selectedNoOfDice) {
                            ForEach(numberOfDice, id: \.self) {
                                Text(String($0))
                            }
                        }
                    }
                    
                    HStack {
                        Text("Number of sides")
                        
                        Spacer()
                        
                        Picker("Select number of sides", selection: $selectedNoOfSides) {
                            ForEach(numberOfSides, id: \.self) {
                                Text(String($0))
                            }
                        }
                    }
                    
                    NavigationLink {
                        List(scores) { score in
                            HStack {
                                Text("\(score.totalScore)")
                                    .font(.title3)
                                
                                if score.scoreBreakdown.count > 1 {
                                    Text("(\(score.scoreBreakdown.map { String($0) }.joined(separator: ", ")))")
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .navigationTitle("Roll History")
                    } label: {
                        HStack {
                            Text("Roll History")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                
                Spacer()
                Spacer()
                
                Button {
                    rollDice()
                } label: {
                    Text("Roll")
                        .font(.title)
                        .frame(width: 200, height: 60)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .padding()
            .navigationTitle("Dice Roll")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func rollDice() {
        rollResult = 0
        currentRollResults.removeAll()
        
        for _ in 0..<selectedNoOfDice {
            let rollValue = Int.random(in: 1...selectedNoOfSides)
            currentRollResults.append(rollValue)
            rollResult += rollValue
        }
        
        let newScore = Score(totalScore: rollResult, scoreBreakdown: currentRollResults)
        modelContext.insert(newScore)
    }
}

#Preview {
    ContentView()
}
