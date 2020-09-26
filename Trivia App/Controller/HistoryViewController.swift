//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 26/09/20.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {

    var triviaGamehistory = [NSManagedObject]()

    @IBOutlet weak var aaa: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Coming here")
        fetchGameHistoryData()
//        self.tableView.register(UINib.init(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCellId")
        aaa.register(GameHistoryCell.self,
                             forCellReuseIdentifier: "GameHistoryCellId")
    }
    
    func fetchGameHistoryData()
        {
            print("Fetching Data..")
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TriviaGame")
            request.returnsObjectsAsFaults = false
            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    let userName = data.value(forKey: "name") as! String
                    print("User Name is : "+userName)
                    let flagAnswer = data.value(forKey: "flagColorAnswer") as! String
                    print("FlagColorAnswer is : "+flagAnswer)
                    let crickePlayerAnswer = data.value(forKey: "cricketPlayerAnswer") as! String
                    print("crickePlayerAnswer is : "+crickePlayerAnswer)
                    let datet = data.value(forKey: "dateSubmision") as! Date
                    let formatter = DateFormatter()
                       formatter.timeStyle = .short
                      formatter.dateStyle = .medium
                       print(formatter.string(from: datet))
                    
                }
                triviaGamehistory = result as! [NSManagedObject]
                self.aaa.reloadData()
            } catch {
                print("Fetching data Failed")
            }
        }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(triviaGamehistory.count)
        return 0
      //  return triviaGamehistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gamehistoryvc: GameHistoryCell =
            tableView.dequeueReusableCell(withIdentifier: "GameHistoryCellId",
                                          for: indexPath) as! GameHistoryCell
//        let gamehistoryvc: GameHistoryCell = self.tableView.dequeueReusableCell(withIdentifier: "GameHistoryCellId", for: indexPath) as! GameHistoryCell
        gamehistoryvc.tag = indexPath.row
      //  gamehistoryvc.setUp(detail: "GlobalValue.shared.memberList[indexPath.row]")
        return gamehistoryvc
    }
    
}
