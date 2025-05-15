//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/14/25.
//

import UIKit

class SettingsViewController: UIViewController {

    let quizRepo: QuizRepository = QuizRepository.shared
    @IBOutlet weak var userURLInputField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var customStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userURLInputField.text = quizRepo.getSourceURL()
        customStatusLabel.isHidden = true
        spinner.isHidden = true
    }
    
    
    @IBAction func newUrlSubmitted(_ sender: Any) {
        guard let newInput = userURLInputField.text, !newInput.isEmpty else {
            customStatusLabel.text = "Please enter a valid URL"
            customStatusLabel.isHidden = false
            return
        }
        spinner.isHidden = false
        spinner.startAnimating()
        
        QuizRepository.shared.updateSourceUrl(newInput) { result in
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.customStatusLabel.text = result
                self.customStatusLabel.isHidden = false
            }
        }
    }
}
