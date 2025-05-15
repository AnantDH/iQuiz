//
//  Quiz.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import Foundation

struct Quiz: Codable {
    let topic: String
    let description: String
    let image: String?
    let questions: [QuizQuestion]
    
    enum CodingKeys: String, CodingKey {
        case topic = "title"
        case description = "desc"
        case image
        case questions
    }
}
