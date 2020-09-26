//
//  GameHistoryCell.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 26/09/20.
//

import UIKit
import CoreData

class GameHistoryCell: UITableViewCell {
    //GameViewCell
    @IBOutlet weak var gameTitleLabel: UILabel?
    @IBOutlet weak var nameLabelOutlet: UILabel?
    @IBOutlet weak var firstQuestionLabelOutlet: UILabel?
    @IBOutlet weak var firstAnswerLabelOutlet: UILabel?
    @IBOutlet weak var secondQuestionLabelOutlet: UILabel?
    @IBOutlet weak var secondAnswerLabelOutlet: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(detail: NSManagedObject, index: Int){
        let userName = detail.value(forKey: "name") as! String
        let flagAnswer = detail.value(forKey: "flagColorAnswer") as! String
        let crickePlayerAnswer = detail.value(forKey: "cricketPlayerAnswer") as! String
        let date = detail.value(forKey: "dateSubmision") as! Date
        let formatter = DateFormatter()
           formatter.timeStyle = .short
        formatter.dateStyle = .medium
        gameTitleLabel?.text = "Game \(index) : \(formatter.string(from: date))"
        nameLabelOutlet?.text = "Name: \(userName)"
        firstQuestionLabelOutlet?.text = "Who is the best cricketer in the world?"
        firstAnswerLabelOutlet?.text = "Answer: \(crickePlayerAnswer)"
        secondQuestionLabelOutlet?.text = "What are the colors in the national flag?"
        secondAnswerLabelOutlet?.text = "Answer: \(flagAnswer)"
        
    }
}
