//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 25/09/20.
//

import Foundation
import UIKit
import CoreData

var context : NSManagedObjectContext!
let appDelegate = UIApplication.shared.delegate as! AppDelegate


class SummaryViewController: UIViewController {
    
    @IBOutlet weak var summaryLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var cricketAnswerLabelOutlet: UILabel!
    @IBOutlet weak var flagAnswerLabelOutlet: UILabel!
    @IBOutlet weak var finishButtonOutlet: UIButton!
    @IBOutlet weak var historyButtonOutlet: UIButton!
    
    var cricketAnswer: String = ""
    var name: String = ""
    var flagAnswer: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Summary"
        summaryLabelOutlet.text = "Summary"
        nameLabelOutlet.text = "Hello \(GlobalValue.shared.name),"
        cricketAnswerLabelOutlet.text = "Answer: "+GlobalValue.shared.cricketAnswer
        flagAnswerLabelOutlet.text = "Answers: "+GlobalValue.shared.flagAnswer
    }
    
    @IBAction func finishButtonAction(_ sender: Any) {
        openDatabse()
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    @IBAction func historyButtonAction(_ sender: Any) {
      //  openDatabse()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GameHistoryViewController") as? GameHistoryViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func openDatabse()
       {
           context = appDelegate.persistentContainer.viewContext
           let entity = NSEntityDescription.entity(forEntityName: "TriviaGame", in: context)

           let newUser = NSManagedObject(entity: entity!, insertInto: context)
           saveData(UserDBObj:newUser)
       }

       func saveData(UserDBObj:NSManagedObject)
       {
                
        let currentDateTime = Date()
        UserDBObj.setValue(name, forKey: "name")
        UserDBObj.setValue(flagAnswer, forKey: "flagColorAnswer")
        UserDBObj.setValue(cricketAnswer, forKey: "cricketPlayerAnswer")
        UserDBObj.setValue(currentDateTime, forKey: "dateSubmision")
        
           print("Storing Data..")
           do {
               try context.save()
            
           } catch {
               print("Storing data Failed")
           }
        print("Successfully Stored")
         //  fetchData()
       }
}
