//
//  ViewController.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 25/09/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
    }
        
    @IBAction func nextButtonAction(_ sender: Any) {
        
        //Checking whether the name field is empty.
        if ((nameTextField.text!.isEmpty)) {
            let alert = UIAlertController(title: "Name should not be empty!",
                                          message: "Kindly add your name",
                                          preferredStyle: .alert)
            
            let okayAction = UIAlertAction(title: "Okay",
                                           style: .cancel)
            
            
            alert.addAction(okayAction)
            
            present(alert, animated: true)
        } else {
          //  openDatabse()
            
           // let vc = CricketQuestionController(nibName: "CricketQuestionController", bundle: nil)
            
            GlobalValue.shared.name = nameTextField.text!
           
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CricketQuestionController") as? CricketQuestionController
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
}

