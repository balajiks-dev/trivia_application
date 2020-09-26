//
//  GameHistoryViewController.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 26/09/20.
//

import UIKit
import CoreData

class GameHistoryViewController: UITableViewController {
    
    var triviaGamehistory = [NSManagedObject]()

        
   // @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGameHistoryData()
        self.tableView.register(UINib.init(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCellId")
        //tableView.register(UINib.init(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCellId")
//        tableView.register(GameHistoryCell.self,
//                             forCellReuseIdentifier: "GameHistoryCellId")
    }
    
    func fetchGameHistoryData()
        {
            print("Fetching Data..")
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TriviaGame")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
//                for data in result as! [NSManagedObject] {
//                    let userName = data.value(forKey: "name") as! String
//                    print("User Name is : "+userName)
//                    let flagAnswer = data.value(forKey: "flagColorAnswer") as! String
//                    print("FlagColorAnswer is : "+flagAnswer)
//                    let crickePlayerAnswer = data.value(forKey: "cricketPlayerAnswer") as! String
//                    print("crickePlayerAnswer is : "+crickePlayerAnswer)
//                    let datet = data.value(forKey: "dateSubmision") as! Date
//                    let formatter = DateFormatter()
//                       formatter.timeStyle = .short
//                      formatter.dateStyle = .medium
//                       print(formatter.string(from: datet))
//                    
//                }
                triviaGamehistory = result as! [NSManagedObject]
                tableView.reloadData()
            } catch {
                print("Fetching data Failed")
            }
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return triviaGamehistory.count
    }
    
    override func tableView(_ tableView: UITableView,
                    cellForRowAt indexPath: IndexPath)
                    -> UITableViewCell {

        let gamehistoryvc: GameHistoryCell =
            self.tableView.dequeueReusableCell(withIdentifier: "GameHistoryCellId", for : indexPath) as! GameHistoryCell

        gamehistoryvc.tag = indexPath.row
        gamehistoryvc.setUp(detail: triviaGamehistory[indexPath.row], index: (indexPath.row + 1))
        return gamehistoryvc
     }
   }

