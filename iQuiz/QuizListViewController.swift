//
//  QuizListViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import UIKit

class QuizListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSHomeDirectory() + "/Documents/quizzes.json"
        let fm = FileManager()
        
        // first check if the user changed the directory
        let currSource = UserDefaults.standard.string(forKey: "currentSourceUrl") ?? ""
        let setUrl = UserDefaults.standard.string(forKey: "quizSourceUrl") ?? "https://tednewardsandbox.site44.com/questions.json"
        if currSource != setUrl {
            QuizRepository.shared.updateSourceUrl(setUrl, tableView: self.tableView) { success in
                if success {
                    UserDefaults.standard.set(setUrl, forKey: "currentSourceUrl")
                } else {
                    self.showAlert(title: "Error", message: "Failed to fetch new quizzes! Navigate to settings to use a different URL.")
                }
            }
        } else { // urls are the same check for saved data otherwise fetch
            if fm.fileExists(atPath: path) {
                loadData(filePath: path)
            } else {
                QuizRepository.shared.updateSourceUrl(currSource, tableView: self.tableView) { success in
                    if !success {
                        self.showAlert(title: "Error", message: "Failed to fetch new quizzes! Navigate to settings to use a different URL.")
                    }
                }
            }
        }
    }
    
    func loadData(filePath: String) {
        do {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            let decoded = try JSONDecoder().decode([Quiz].self, from: data)
            QuizRepository.shared.quizzes = decoded
            self.tableView.reloadData()
        } catch {
            print("Failed to load or decode stored Quiz Data \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizRepository.shared.quizzes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell", for: indexPath) as! QuizTableViewCell
        let quiz = QuizRepository.shared.quizzes[indexPath.row]
        cell.topicLabel.text = quiz.topic
        let iconName = quiz.image ?? "questionmark.circle"
        cell.imageViewElement.image = UIImage(systemName: iconName)
        cell.descriptionLabel.text = quiz.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuiz = QuizRepository.shared.quizzes[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let quizQuestionVC = storyboard.instantiateViewController(withIdentifier: "QuizQuestionViewController") as? QuizQuestionViewController {
            quizQuestionVC.quiz = selectedQuiz
            navigationController?.pushViewController(quizQuestionVC, animated: true)
        }
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        if let url = URL(string: UIApplication.openSettingsURLString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }

}
