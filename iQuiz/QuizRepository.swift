//
//  QuizRepository.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import Foundation
import UIKit

class QuizRepository {
    static let shared = QuizRepository()
    
    var quizzes: [Quiz] = []

    
    func updateSourceUrl(_ newUrl: String, tableView: UITableView, completion: ((Bool) -> Void)? = nil) {
        guard let url = URL(string: newUrl) else {
            completion?(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                completion?(false)
                return
            }

            guard let data = data else {
                print("No data received")
                completion?(false)
                return
            }

            do {
                let decoded = try JSONDecoder().decode([Quiz].self, from: data)

                // Save to local file
                let path = NSHomeDirectory() + "/Documents/quizzes.json"
                let fileUrl = URL(fileURLWithPath: path)
                try? data.write(to: fileUrl)

                DispatchQueue.main.async {
                    self.quizzes = decoded
                    tableView.reloadData()
                    completion?(true)
                }
            } catch {
                print("Error decoding: \(error)")
                completion?(false)
            }
        }.resume()
    }

}
