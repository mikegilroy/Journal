//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: Actions
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let currentEntry = entry {
            if let currentTitle = titleTextField.text {
                currentEntry.title = currentTitle
            }
            if let currentBodyText = bodyTextView.text {
                currentEntry.bodyText = currentBodyText
            }
            currentEntry.timestamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, bodyText: self.bodyTextView.text!)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.bodyText
    }

    /*
    // MARK: - Navigation?

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    // MARK: Text Field
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
