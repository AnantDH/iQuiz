//
//  QuestionResultViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/9/25.
//

import UIKit

class QuestionResultViewController: UIViewController {

    var isCorrect: Bool?
    var questionPrompt: String?
    var correctAnswer: String?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerStatusLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionPrompt!
        correctAnswerLabel.text = "Correct Answer: \(correctAnswer!)"
        if isCorrect! {
            answerStatusLabel.text = "Correct!"
            answerStatusLabel.textColor = .green
        } else {
            answerStatusLabel.text = "Incorrect!"
            answerStatusLabel.textColor = .red
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
