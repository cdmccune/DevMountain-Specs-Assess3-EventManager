//
//  EventListTableViewCell.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import UIKit

protocol EventListTableViewCellDelegate: AnyObject {
    func attendingSwitchTapped()
}

class EventListTableViewCell: UITableViewCell {
    
    
    @IBOutlet var isAttendingSwitch: UISwitch!
    @IBOutlet var eventTimeLabel: UILabel!
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var eventTypeImage: UIImageView!
    
    func updateViews() {
        if let event = event, let date = event.startDate, let eventType = event.eventType  {
            isAttendingSwitch.isOn = event.isAttending
            eventTimeLabel.text = "\(date)"
            eventNameLabel.text = event.name
            eventTypeImage.image = UIImage(systemName: eventType)
        }
    }
    

    var event: Event? {
        didSet {
            updateViews()
        }
    }
    
    
  
    
    
}
