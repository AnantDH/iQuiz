//
//  QuizQuestionViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/8/25.
//

import UIKit

class QuizQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var quiz: Quiz?
    
    @IBOutlet weak var quizTitleLabel: UILabel!
    @IBOutlet weak var quizQuestionLabel: UILabel!
    @IBOutlet weak var questionTableView: UITableView!
    
    var currQuestion = 1
    var numQuestions = 4
    var numCorrect = 0
    var selectedRow: Int? = nil
    var hasAdvancedQuestion = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numQuestions = quiz!.questions.count
        
        quizTitleLabel.text = "\(quiz!.topic) \(currQuestion)/\(numQuestions)"
        
        quizQuestionLabel.text = quiz!.questions[currQuestion-1].questionPrompt
        
        questionTableView.delegate = self
        questionTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz!.questions[currQuestion-1].answerChoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = quiz!.questions[currQuestion-1].answerChoices[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if let selectedOption = selectedRow {
            var isCorrect = false
            if selectedOption == quiz!.questions[currQuestion-1].correctAnswerIndex {
                numCorrect += 1
                isCorrect = true
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let questionResultVC = storyboard.instantiateViewController(withIdentifier: "QuestionResultViewController") as? QuestionResultViewController {
                questionResultVC.isCorrect = isCorrect
                questionResultVC.questionPrompt = quiz!.questions[currQuestion-1].questionPrompt
                questionResultVC.correctAnswer = quiz!.questions[currQuestion-1].answerChoices[quiz!.questions[currQuestion-1].correctAnswerIndex]
                navigationController?.pushViewController(questionResultVC, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if hasAdvancedQuestion {
            super.viewWillAppear(animated)
            if currQuestion < numQuestions {
                currQuestion += 1
                selectedRow = nil
                quizTitleLabel.text = "\(quiz!.topic) \(currQuestion)/\(numQuestions)"
                quizQuestionLabel.text = quiz!.questions[currQuestion-1].questionPrompt
                questionTableView.reloadData()
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let resultsVC = storyboard.instantiateViewController(withIdentifier: "QuizFinishedViewController") as? QuizFinishedViewController {
                    resultsVC.numCorrect = numCorrect
                    resultsVC.numQuestions = numQuestions
                    navigationController?.pushViewController(resultsVC, animated: false)
                }
            }
        } else {
            hasAdvancedQuestion = true
        }
    }
    
}

