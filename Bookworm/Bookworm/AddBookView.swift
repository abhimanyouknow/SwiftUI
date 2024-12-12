//
//  AddBookView.swift
//  Bookworm
//
//  Created by C3PO MBP on 10/12/24.
//

import SwiftUI

// challenge 1 - part 1
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Romance", "Poetry", "Thriller"]
    
    // challenge 1 - part 2
    var isValidEntry: Bool {
        if title.trimmed().isEmpty || author.trimmed().isEmpty {
            return false
        }
        
        return true
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        
                        modelContext.insert(newBook)
                        
                        dismiss()
                    }
                }
                // challenge 1 - part 3
                .disabled(!isValidEntry)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
