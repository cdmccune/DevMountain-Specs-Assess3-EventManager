//
//  EventListTableViewCell.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import UIKit

protocol EventListTableViewCellDelegate: AnyObject {
    func attendingSwitchTapped(event: Event, attending: Bool)
}

class EventListTableViewCell: UITableViewCell {
    
    
    @IBOutlet var isAttendingSwitch: UISwitch!
    @IBOutlet var eventTimeLabel: UILabel!
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var eventTypeImage: UIImageView!
    
    weak var delegate: EventListTableViewCellDelegate?
    
    func updateViews() {
        if let event = event, let date = event.startDate, let eventType = event.eventType  {
            isAttendingSwitch.isOn = event.isAttending
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            let styledDate = dateFormatter.string(from: date)
            
            eventTimeLabel.text = styledDate
            eventNameLabel.text = event.name
            eventTypeImage.image = UIImage(systemName: eventType)
        }
    }
    

    var event: Event? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBAction func eventSwitchTapped(_ sender: Any) {
        
        if let delegate = delegate, let event = event {
            event.isAttending.toggle()
            
    
            delegate.attendingSwitchTapped(event: event, attending: isAttendingSwitch.isOn)
        }
    }
    
    
    
}
