//
//  QuizListViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import UIKit

class QuizListViewController: UITableViewController {
    
    let quizzes = QuizRepository.shared.quizzes
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell", for: indexPath) as! QuizTableViewCell
        let quiz = quizzes[indexPath.row]
        cell.topicLabel.text = quiz.topic
        cell.imageViewElement.image = UIImage(systemName: quiz.image)
        cell.descriptionLabel.text = quiz.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuiz = quizzes[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let quizQuestionVC = storyboard.instantiateViewController(withIdentifier: "QuizQuestionViewController") as? QuizQuestionViewController {
            quizQuestionVC.quiz = selectedQuiz
            navigationController?.pushViewController(quizQuestionVC, animated: true)
        }
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
}
