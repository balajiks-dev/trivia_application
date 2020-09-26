//
//  CricketQuestion.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 25/09/20.
//

import Foundation
import UIKit

class CricketQuestionController: UIViewController {
    
    @IBOutlet weak var option1LabelOutlet: UILabel!
    @IBOutlet weak var option2LabelOutlet: UILabel!
    @IBOutlet weak var option3LabelOutlet: UILabel!
    @IBOutlet weak var option4LabelOutlet: UILabel!
    @IBOutlet weak var option1ButtonOutlet: UIButton!
    @IBOutlet weak var option2ButtonOutlet: UIButton!
    @IBOutlet weak var option3ButtonOutlet: UIButton!
    @IBOutlet weak var option4ButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GlobalValue.shared.gameQuestion1
        option1LabelOutlet.text = "Sachin Tendulkar"
        option2LabelOutlet.text = "Virat Kolli"
        option3LabelOutlet.text = "Adam Gilchirst"
        option4LabelOutlet.text = "Jacques Kallis"
        option1ButtonOutlet.isSelected = true
        option2ButtonOutlet.isSelected = false
        option3ButtonOutlet.isSelected = false
        option4ButtonOutlet.isSelected = false
    }
    @IBAction func selectionButtonAction(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            option1ButtonOutlet.isSelected = true
            option2ButtonOutlet.isSelected = false
            option3ButtonOutlet.isSelected = false
            option4ButtonOutlet.isSelected = false
        } else if (sender as AnyObject).tag == 2 {
            option1ButtonOutlet.isSelected = false
            option2ButtonOutlet.isSelected = true
            option3ButtonOutlet.isSelected = false
            option4ButtonOutlet.isSelected = false
        } else if (sender as AnyObject).tag == 3 {
            option1ButtonOutlet.isSelected = false
            option2ButtonOutlet.isSelected = false
            option3ButtonOutlet.isSelected = true
            option4ButtonOutlet.isSelected = false
        } else if (sender as AnyObject).tag == 4 {
            option1ButtonOutlet.isSelected = false
            option2ButtonOutlet.isSelected = false
            option3ButtonOutlet.isSelected = false
            option4ButtonOutlet.isSelected = true
        }
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FlagColorViewController") as? FlagColorViewController
        if(option1ButtonOutlet.isSelected) {
            GlobalValue.shared.cricketAnswer = option1LabelOutlet.text!
        } else if(option2ButtonOutlet.isSelected) {
            GlobalValue.shared.cricketAnswer = option2LabelOutlet.text!
        } else if(option3ButtonOutlet.isSelected) {
            GlobalValue.shared.cricketAnswer = option3LabelOutlet.text!
        } else if(option4ButtonOutlet.isSelected) {
            GlobalValue.shared.cricketAnswer = option4LabelOutlet.text!
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

