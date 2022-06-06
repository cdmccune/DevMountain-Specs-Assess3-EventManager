//
//  Notification Scheduler.swift
//  EventManager
//
//  Created by Curt McCune on 6/5/22.
//

import Foundation
import UserNotifications

class NotificationScheduler {
    
    func scheduleNotifications(for event: Event) {
        guard let id = event.id, !id.isEmpty else {return}
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Your event: \(event.name ?? ""), is starting is starting in 15 minutes"
        content.sound = .default
        content.categoryIdentifier = "notificationCategory"
        
        let newDate = Calendar.current.date(byAdding: .minute, value: -15, to: event.startDate ?? Date())
        
        let fireDate = Calendar.current.dateComponents([.day,.hour,.minute], from: newDate ?? Date())
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                
                
                print("Unable to add notifications request: \(error)")
            }
        }
    }
    
    
    func deleteNotification(for event: Event) {
        
        
        guard let id = event.id else {return}
     
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        
    }
}


