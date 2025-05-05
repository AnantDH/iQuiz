//
//  QuizRepository.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import Foundation

class QuizRepository {
    static let shared = QuizRepository()
    private init() {}
    
    let quizzes: [Quiz] = [
        Quiz(topic: "Mathematics", description: "Addition, subtraction, and multiplication", image: "function"),
        Quiz(topic: "Marvel Super Heroes", description: "How well do you know the Marvel Super Heroes?", image: "bolt.fill"),
        Quiz(topic: "Science", description: "Physics, Astronomy, and Biology", image: "atom")
    ]
}
