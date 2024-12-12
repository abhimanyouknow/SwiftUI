//
//  Book.swift
//  Bookworm
//
//  Created by C3PO MBP on 10/12/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var date: Date // challenge 3 - part 1
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date // challenge 3 - part 2
    }
}
