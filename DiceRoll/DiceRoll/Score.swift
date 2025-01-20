//
//  Score.swift
//  DiceRoll
//
//  Created by C3PO MBP on 20/01/25.
//

import Foundation
import SwiftData

@Model
class Score {
    var id = UUID()
    var totalScore: Int
    var scoreBreakdown: [Int]
    
    init(totalScore: Int, scoreBreakdown: [Int]) {
        self.totalScore = totalScore
        self.scoreBreakdown = scoreBreakdown
    }
}
