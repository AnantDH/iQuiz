//
//  QuizQuestion.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/8/25.
//

import Foundation

struct QuizQuestion: Codable {
    let questionPrompt: String
    let correctAnswerIndex: String
    let answerChoices: [String]

    enum CodingKeys: String, CodingKey {
        case questionPrompt = "text"
        case correctAnswerIndex = "answer"
        case answerChoices = "answers"
    }
}

