//
//  EntryListViewController.swift
//  Journal
//
//  Created by Caleb Hicks on 9/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Travel Notes"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // reload tableView data each time tableView appears
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // deque reusable cell
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        // capture entry using indexPath
        let entry = EntryController.sharedController.entries[indexPath.row]
        
        // Set text of cell using captured entry object
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = "\(entry.timestamp)"
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Check editing style
        if editingStyle == .Delete {
            
                // Capture entry being edited using indexPath
                let entry = EntryController.sharedController.entries[indexPath.row]
            
                // Remove entry from the entry array
                EntryController.sharedController.removeEntry(entry)
            
                // Delete the row containing the entry
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
        
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "toViewEntry" {
            
            // Use if let to capture instance of destination view controller
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController {
                
                // force load destination view controller views
                _ = detailViewController.view
                
                // capture indexPath of selected row
                let indexPath = tableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    // use indexPath of selected row to capture current entry
                    let entry = EntryController.sharedController.entries[selectedRow]
                    
                    // pass current entry object to detailViewController with updateWith function
                    detailViewController.updateWithEntry(entry)
                    detailViewController.entry = entry
                }
            }
        }
     }
    
    
    // MARK: Actions
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        if tableView.editing {
            tableView.setEditing(false, animated: true)
        } else {
            tableView.setEditing(true, animated: true)
        }
    }
    
    
    

}

