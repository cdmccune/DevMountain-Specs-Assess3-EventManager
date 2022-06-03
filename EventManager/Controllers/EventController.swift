//
//  EventController.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import Foundation
import CoreData

class EventController {
    
    static var shared = EventController()
    
    private lazy var fetchRequest: NSFetchRequest<Event> = {
        let request = NSFetchRequest<Event>(entityName: Strings.eventEntityName)
        request.predicate = NSPredicate(value: true)
        let sortDescriptor = NSSortDescriptor(key: Strings.startDateKey, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }()
    
    var sections: [[Event]] {[attendingEvents, notAttendingEvents]}
    private var attendingEvents: [Event] = []
    private var notAttendingEvents: [Event] = []
    
    
    //CRUD
    
    func createEvent(name: String, descriptionText: String, date: Date, eventType: String) {
        let event = Event(name: name, descriptionText: descriptionText, date: date, eventType: eventType)
        notAttendingEvents.append(event)
        CoreDataStack.saveContext()
    }
    
    func fetchEvents() {
        let events = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.attendingEvents = events.filter({ $0.isAttending})
        self.notAttendingEvents = events.filter({!$0.isAttending})
        
    }
    
    func updateEvent(event: Event, name: String, descriptionText: String, date: Date, eventType: String) {
        event.name = name
        event.descriptionText = descriptionText
        event.startDate = date
        event.eventType = eventType
        
        CoreDataStack.saveContext()
    }
    
    func deleteEvent(_ event: Event) {
        if let index = attendingEvents.firstIndex(of: event){
            attendingEvents.remove(at: index)
        } else if let index = notAttendingEvents.firstIndex(of: event) {
            notAttendingEvents.remove(at: index)
        }
        
        CoreDataStack.context.delete(event)
        CoreDataStack.saveContext()
                    
    }
    
}
