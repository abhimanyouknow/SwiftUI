//
//  ContentView.swift
//  WordScramble
//
//  Created by C3PO MBP on 15/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    // properties for alert
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingErrorAlert = false
    
    // challenge 3
    @State private var score: Double = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                // challenge 3
                Section {
                    Text("Your Score: \(score.formatted())")
                        .font(.headline)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            /* displaying how many letters in
                             current word */
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
                /* invokes the specified method whenever user
                 presses the return key */
            .onAppear(perform: startGame)
                /* invokes the specified function whenever this
                 view is loaded */
            .alert(alertTitle, isPresented: $showingErrorAlert) { } message: {
                Text(alertMessage)
                /* note how we haven't added code for an empty
                 OK button before the message. if we don't
                 specify any button, SwiftUI automaticallty
                 assigns an OK button for us */
            }
            // challenge 2
            .toolbar {
                Button(action: startGame) {
                    Text("New Game")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
    
    /* function to add new word to the list whenver the user
     hits the 'return' key */
    func addNewWord() {
        // lowercase string & remove any white spaces
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // ensuring there is at least one letter
        guard answer.count > 0 else { return }
        
        // challenge 1 - part 1
        guard minimumLettersCheck(word: answer) else {
            wordError(title: "Too few letters", message: "Your guess word must have at least three letters!")
            return
        }
        
        // challenge 1 - part 2
        guard answer != rootWord else {
            wordError(title: "Same as '\(rootWord)'", message: "You cannot enter '\(rootWord)', try something else.")
            return
        }
        
        // calling input validation method 1
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        // calling input validation method 2
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        // calling input validation method 3
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up!")
            return
        }
        
        // challenge 3
        score += calculateScore(word: answer)
        
        withAnimation {
            /* adding the new word to the usedWords array with
             animation. typically with arrays, we use the
             .append() modifier, but here we will use the
             .insert modifier so that we can add the new words
             at the 0th index, i.e., at the top */
            usedWords.insert(answer, at: 0)
        }
        
        // emptying the newWord property
        newWord = ""
    }
    
    /* function which will load the start.txt file from the
     bundle into our app, or call fatalError() if something goes
     wrong */
    func startGame() {
        // step 1: fiding url for start.txt inside the bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // step 2: loading the file into a string
            if let startWords = try? String.init(contentsOf: startWordsURL) {
                /* at this stage, the entire file is loaded into
                 a single string, startWords. we want to split
                 this string into an array, containing all the
                 words which are separated by new lines */
                let allWords = startWords.components(separatedBy: "\n")
                
                /* now, we pick a random word from this array
                 and assign it to the rootWord property */
                rootWord = allWords.randomElement() ?? "silkworm"
                    /* we're using nil coalescing because
                     .randomElements() returns an optinal value,
                     even though we know that at this stage we
                     will get a value */
                
                // challenge 3
                // reset the score
                score = 0
                // reset the usedWords array
                usedWords.removeAll()
                
                /* if we've made it this far, then everything
                 worked correctly. we can exit the start method
                 */
                return
            }
        }
        
        // if the code reaches here - there was an error
        fatalError("Could not load start.txt from bundle.")
    }
    
    // input validation method 1 - checking duplicates
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    /* input validation method 2 - ensuring the input word is
     made from the same letters as the root word */
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord /* temp variable so that the
                                 original rootWord is unaffected
                                 */
        
        // looping over each letter of the input word
        for letter in word {
            /* determining the position in the temp word where
             the letter of the input word lies*/
            if let pos = tempWord.firstIndex(of: letter) {
                /* removing the matching letter from the temp
                 word */
                tempWord.remove(at: pos)
            } else {
                /* if any letter in the input word is not found anywhere in the temp word, return false */
                return false
            }
        }
        
        /* if we've reached here, that means we've gone through
         all the letters of the input word and they all are
         contained in the temp word, which corresponds to the
         root word */
        return true
    }
    
    /* input validation method 3 - checking if the input word is
     a valid english word */
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    /* input validation method 4 - setting alert title and
     message based on the error and displaying the alert */
    func wordError(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showingErrorAlert = true
    }
    
    // challenge 1
    func minimumLettersCheck(word: String) -> Bool {
        !(word.count < 3)
    }
    
    // challenge 3
    // method for calculating score based on # of letter of input
    func calculateScore(word: String) -> Double {
        (Double(word.count) / 8) * 10
    }
}

#Preview {
    ContentView()
}
