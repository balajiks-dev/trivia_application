//
//  SelectionIndianFlagColor.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 25/09/20.
//

import Foundation
import UIKit
import CoreData

class FlagColorViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var flagAnswer: String = ""
    
    @IBOutlet weak var whiteLabelOutlet: UILabel!
    @IBOutlet weak var yellowLabelOutlet: UILabel!
    @IBOutlet weak var orangeLabelOutlet: UILabel!
    @IBOutlet weak var greenLabelOutlet: UILabel!
    
    @IBOutlet weak var whiteButtonOutlet: UIButton!
    @IBOutlet weak var yellowButtonOutlet: UIButton!
    @IBOutlet weak var orangeButtonOutlet: UIButton!
    @IBOutlet weak var greenButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
   
        
    var flag1 = false
    var flag2 = false
    var flag3 = false
    var flag4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GlobalValue.shared.gameQuestion2
    }
    
    @IBAction func whiteButtonAction(_ sender: UIButton) {
        if (flag1 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox_selected")),for: UIControl.State.normal)
            flag1 = true
        } else {
            sender.setBackgroundImage((UIImage(named: "checkbox_unselected")),for: UIControl.State.normal)
            flag1 = false
        }
    }
    @IBAction func yellowButtonAction(_ sender: UIButton) {
        if (flag2 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox_selected")),for: UIControl.State.normal)
            flag2 = true
        } else {
            sender.setBackgroundImage((UIImage(named: "checkbox_unselected")),for: UIControl.State.normal)
            flag2 = false
        }
    }
    @IBAction func orangeButtonAction(_ sender: UIButton) {
        if (flag3 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox_selected")),for: UIControl.State.normal)
            flag3 = true
        } else {
            sender.setBackgroundImage((UIImage(named: "checkbox_unselected")),for: UIControl.State.normal)
            flag3 = false
        }
    }
    @IBAction func greenButtonAction(_ sender: UIButton) {
        if (flag4 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox_selected")),for: UIControl.State.normal)
            flag4 = true
        } else {
            sender.setBackgroundImage((UIImage(named: "checkbox_unselected")),for: UIControl.State.normal)
            flag4 = false
        }
    }
    @IBAction func nextButtonAction(_ sender: Any) {
        if (flag1 == false && flag2 == false && flag3 == false && flag4 == false){
            let alert = UIAlertController(title: "Anyone of answer should be selected",
                                          message: "Kindly select any one of the answer",
                                          preferredStyle: .alert)
            
            let okayAction = UIAlertAction(title: "Okay",
                                           style: .cancel)
            
            
            alert.addAction(okayAction)
            
            present(alert, animated: true)
        } else {
            
            if(flag1 == true) {
                flagAnswer = whiteLabelOutlet.text!
               // flagColorAnser.append(whiteLabelOutlet.text! as NSString)
            } else if(flag2 == true) {
                if (flagAnswer != ""){
                flagAnswer = flagAnswer + "," + yellowLabelOutlet.text!
                } else {
                    flagAnswer = orangeLabelOutlet.text!
                }
              //  flagColorAnser.append(yellowLabelOutlet.text! as NSString)
            } else if(flag3 == true){
                if (flagAnswer != ""){
                    flagAnswer = flagAnswer + "," + orangeLabelOutlet.text!
                } else {
                    flagAnswer = orangeLabelOutlet.text!
                }
               // flagColorAnser.append(orangeLabelOutlet.text! as NSString)
            }else if(flag4 == true){
                if (flagAnswer != ""){
                flagAnswer = flagAnswer + "," + greenLabelOutlet.text!
                } else {
                    flagAnswer = orangeLabelOutlet.text!
                }
            }
            
            GlobalValue.shared.flagAnswer = self.flagAnswer
            
            openDatabse()

            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SummaryViewController") as? SummaryViewController
            vc?.flagAnswer = self.flagAnswer
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
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
        UserDBObj.setValue(GlobalValue.shared.name, forKey: "name")
        UserDBObj.setValue(GlobalValue.shared.flagAnswer, forKey: "flagColorAnswer")
        UserDBObj.setValue(GlobalValue.shared.cricketAnswer, forKey: "cricketPlayerAnswer")
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
