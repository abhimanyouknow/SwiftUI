//
//  ContentView.swift
//  WordScramble
//
//  Created by C3PO MBP on 15/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
    
    func testStrings() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let input2 = """
        a
        b
        c
        """
        let letters2 = input.components(separatedBy: "\n")
        
        // getting a random value from the array
        let randomLetter = letters2.randomElement() ?? "a"
            /* NOTE: .randomElement() returns an optional
             string element since it does not know whether the
             string is empty or not, hence the nil coalescing
             (alternatively, we can also simply try to unwrap
             the string using if let) */
        
        let trimmed = randomLetter.trimmingCharacters(in: .whitespacesAndNewlines)
            /* removing whitespaces and new lines from a
             string */
    }
    
    // function for checking misspelled words
    func checkSpelling() {
        // step 1: make a word to check
        let word = "swift"
        
        // step 2: make an instance of UITextChecker
        let checker = UITextChecker()
        
        /* step 3: we want to tell the instance of
         UITextChecker how much of our string we want to
         check */
        let range = NSRange(location: 0, length: word.utf16.count)
            /* utf16 is the character encoding - we use this
             here so that objective C can understand how swfit
             strings are stored */
        
        /* step 4: telling our text checker to report where it
         found any misspelled words in our string - passing in
            - the string to check
            - the range to check
            - the position to start from within the range
            - whether it should wrap around to the beginning again
            - which language it should use for the dictionary
         
         this sends back another objective C string range,
         telling us where the misspelled word was found
         */
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        /* step 5: checking if there were any misspelled words
         - if there were no misspelled words, we get back a
         special value "NSNotFound" */
        let allGood = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}
