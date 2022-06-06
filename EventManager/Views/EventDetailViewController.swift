//
//  EventDetailViewController.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import Foundation
import UIKit

class EventDetailViewController: UIViewController {
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var borderedView: UIView!
    @IBOutlet var eventPopUpButton: UIButton!
    @IBOutlet var eventDatePicker: UIDatePicker!
    @IBOutlet var descriptionTextView: UITextView!
    
    enum EventTypes {
        case entertainment
        case social
        case work
    }
    
    private var eventType: EventTypes = .entertainment
    
    var event: Event?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        borderedView.layer.cornerRadius = 10
        borderedView.layer.borderWidth = 10
        borderedView.layer.borderColor = UIColor(red: 150/255.0, green: 178/255.0, blue: 143/255.0, alpha: 1.0).cgColor
        
        borderedView.layer.shadowColor = UIColor.black.cgColor
        borderedView.layer.shadowOpacity = 0.8
        borderedView.layer.shadowOffset = .zero
        borderedView.layer.shadowRadius = 5
        
        eventPopUpButton.layer.cornerRadius = 5
        eventPopUpButton.layer.borderWidth = 2
        eventPopUpButton.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 2
        titleTextField.layer.borderWidth = 2
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        titleTextField.layer.cornerRadius = 5
        
        
        if let event = event{
            titleTextField.text = event.name
            descriptionTextView.text = event.descriptionText
            if let date = event.startDate {
                eventDatePicker.date = date
            } else {
                eventDatePicker.date = Date()
            }
        }
        
        
        let workItem = UIAction(title: "Work", image: UIImage(systemName: "signature")) { (action) in
            self.eventType = .work
        }
        
        let entertainmentItem = UIAction(title: "Entertainment", image: UIImage(systemName: "film")) { (action) in
            
            self.eventType = .entertainment
        }
        
        let socialItem = UIAction(title: "Social", image: UIImage(systemName: "person.3")) { (action) in
            self.eventType = .social
        }
        
        let menu = UIMenu(title: "Event Type", options: .displayInline, children: [entertainmentItem, workItem , socialItem])
        
        eventPopUpButton.menu = menu
        eventPopUpButton.showsMenuAsPrimaryAction = true
        
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        var type = ""
        switch eventType {
        case .social: type = "person.3"
        case .entertainment: type = "film"
        case .work: type = "signature"
        }
        
        if let event = event {
            if let title = titleTextField.text,
               title != "",
               let description = descriptionTextView.text,
               description != "" {
                
                EventController.shared.updateEvent(event: event, name: title, descriptionText: description, date: eventDatePicker.date, eventType: type)
                navigationController?.popViewController(animated: true)
            }
        } else {
            
            if let title = titleTextField.text,
               title != "",
               let description = descriptionTextView.text,
               description != "" {
                
                EventController.shared.createEvent(name: title, descriptionText: description, date: eventDatePicker.date, eventType: type)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}


