//
//  CoreData.swift
//  Trivia App
//
//  Created by Balaji Sundaram on 26/09/20.
//

import Foundation
import CoreData
import UIKit

class TriviaGameData: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var cricketPlayerAnswer: String
    @NSManaged var flagColorAnswer: [NSString]
    @NSManaged var dateSubmision: Date
}
