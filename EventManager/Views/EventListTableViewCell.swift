//
//  EventListTableViewCell.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    
    
    @IBOutlet var isAttendingSwitch: UISwitch!
    @IBOutlet var eventTimeLabel: UILabel!
    @IBOutlet var eventNameLabel: UILabel!
    @IBOutlet var eventTypeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
