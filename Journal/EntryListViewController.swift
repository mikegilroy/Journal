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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedController.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp
        
        return cell
    }
}

