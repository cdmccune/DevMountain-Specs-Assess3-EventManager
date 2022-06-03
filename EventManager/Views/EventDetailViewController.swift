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
    //    @IBOutlet var buttonMenu: UIMenu!
    
    
    
    
    
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
        
        
        
        
        
        let workItem = UIAction(title: "Work", image: UIImage(systemName: "signature")) { (action) in

                print("work action was tapped")
           }

           let entertainmentItem = UIAction(title: "Entertainment", image: UIImage(systemName: "film")) { (action) in

               print("entertainment action was tapped")
           }

           let socialItem = UIAction(title: "Social", image: UIImage(systemName: "person.3")) { (action) in
                print("social action was tapped")
           }

           let menu = UIMenu(title: "Event Type", options: .displayInline, children: [entertainmentItem, workItem , socialItem])
      
        eventPopUpButton.menu = menu
        eventPopUpButton.showsMenuAsPrimaryAction = true
//        eventPopUpButton.changesSelectionAsPrimaryAction = true
    
    }
    
    
   
    
    
    
}


