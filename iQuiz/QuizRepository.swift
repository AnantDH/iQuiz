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
        Quiz(
            topic: "Mathematics",
            description: "Addition, subtraction, and multiplication",
            image: "function",
            questions: [
                QuizQuestion(questionPrompt: "What is 2 + 2?", answerChoices: ["6", "5", "7", "4"], correctAnswerIndex: 3),
                QuizQuestion(questionPrompt: "What is 5 - 3?", answerChoices: ["3", "2", "4", "5"], correctAnswerIndex: 1),
                QuizQuestion(questionPrompt: "What is 3 x 4?", answerChoices: ["12", "13", "16", "20"], correctAnswerIndex: 0)
            ]
        ),
        Quiz(
            topic: "Marvel Super Heroes",
            description: "How well do you know the Marvel Super Heroes?",
            image: "bolt.fill",
            questions: [
                QuizQuestion(questionPrompt: "What is Thor's hammer called?", answerChoices: ["Mjolnir", "Scepter", "Sword", "Jarvis"], correctAnswerIndex: 0),
                QuizQuestion(questionPrompt: "Which infinity stone does Doctor Strange keep on his necklace?", answerChoices: ["Soul Stone", "Mind Stone", "Power Stone", "Time Stone"], correctAnswerIndex: 3)
            ]
        ),
        Quiz(
            topic: "Science",
            description: "Physics, Astronomy, and Biology",
            image: "atom",
            questions: [
                QuizQuestion(questionPrompt: "Which one of these is NOT a star?", answerChoices: ["The Sun", "Sirius", "Jupiter", "Betelgeuse"], correctAnswerIndex: 2),
                QuizQuestion(questionPrompt: "Which of the following is used by plants to convert sunlight into energy?", answerChoices: ["Metabolization", "Photosynthesis", "Solar Cells", "Digestion"], correctAnswerIndex: 1)
            ]
        )
    ]
}
