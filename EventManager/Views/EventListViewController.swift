//
//  EventListViewController.swift
//  EventManager
//
//  Created by Curt McCune on 6/3/22.
//

import Foundation
import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventController.shared.fetchEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
}

extension EventListViewController: UITableViewDelegate {
}

extension EventListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        EventController.shared.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EventController.shared.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.tableViewCellID) as? EventListTableViewCell else {return UITableViewCell()}
        
        cell.event = EventController.shared.sections[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let event = EventController.shared.sections[indexPath.section][indexPath.row]
            EventController.shared.deleteEvent(event)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
