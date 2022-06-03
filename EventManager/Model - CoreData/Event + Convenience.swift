//
//  Event + Convenience.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import Foundation
import CoreData

extension Event {
    @discardableResult convenience init(name: String, descriptionText: String, date: Date, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.id = UUID().uuidString
        self.name = name
        self.descriptionText = descriptionText
        self.startDate = date
        
    }
}
