//
//  ContentView.swift
//  Tables
//
//  Created by C3PO MBP on 21/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showGame = false
    
    @State private var tablesUpto: Int = 2
    let numberOfQuestions: [Int] = [10, 20, 40, 80]
    @State private var selectedQuestionAmount = 10
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
                
                if showGame {
                    
                } else {
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        Section() {
                            VStack(spacing: 10) {
                                Text("Tables Upto")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Stepper("\(tablesUpto)", value: $tablesUpto, in: 2...12, step: 1)
                            }
                        }
                        
                        Section {
                            VStack(spacing: 10) {
                                Text("Number of Questions")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("", selection: $selectedQuestionAmount) {
                                    ForEach(numberOfQuestions, id: \.self) {
                                        Text($0, format: .number)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                        }
                        
                        Spacer()
                        
                        Section {
                            Button("Start") {
                                // add code to start game
                                showGame = true
                            }
                            .padding(50)
                            .background(.red)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                        }
                        
                        Spacer()
                    }
                    .padding(30)
                }
            }
            .navigationTitle("Tables")
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
