//
//  QuizTableViewCell.swift
//  iQuiz
//
//  Created by Anant Dhokia on 5/5/25.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewElement: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
