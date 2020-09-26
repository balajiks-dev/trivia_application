//
//  GlobalValue.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 26/09/20.
//

import Foundation
import CoreData

class GlobalValue {
    static var shared : GlobalValue = GlobalValue()
    var triviaGamehistory = [NSManagedObject]()
    var name: String = ""
    var cricketAnswer: String = ""
    var flagAnswer: String = ""
    var gameQuestion1 : String = "Game Question 1"
    var gameQuestion2 : String = "Game Question 2"
}
