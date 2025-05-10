//
//  QuizFinishedViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/9/25.
//

import UIKit

class QuizFinishedViewController: UIViewController {

    var numCorrect: Int?
    var numQuestions: Int?
    
    @IBOutlet weak var userMessageLabel: UILabel!
    @IBOutlet weak var reportScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numCorrect = numCorrect, let numQuestions = numQuestions {
            reportScoreLabel.text = "You got \(numCorrect)/\(numQuestions) correct!"
            
            let percentageCorrect = Int(round(Double(numCorrect) / Double(numQuestions) * 100))
            if percentageCorrect == 100 {
                userMessageLabel.text = "Perfect Score!!"
            } else if percentageCorrect >= 75 {
                userMessageLabel.text = "Almost There!"
            } else if percentageCorrect >= 50 {
                userMessageLabel.text = "Keep Trying!"
            } else {
                userMessageLabel.text = "Quizzes are hard..."
            }
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
