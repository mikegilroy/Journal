//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIGestureRecognizerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var entry: Entry?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleTextViewSwipe")
        self.bodyTextView.addGestureRecognizer(swipeGestureRecognizer)
        
        self.navigationController?.navigationItem.backBarButtonItem?.target = "saveButtonTapped"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set title of note when detail view appears
        if let newEntry = entry {
            self.title = newEntry.title
        } else {
            self.title = "New Note"
        }
    }
    
    
    override func viewWillDisappear(animated : Bool) {
        
        // force save any changes to an entry when back button pressed
        if (self.isMovingFromParentViewController()){
            self.saveButtonTapped(self.saveButton)
        }
    }

    
    // MARK: Actions
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        
        let alert = UIAlertController()
        alert.title = "Are you sure?"
        alert.message = "Clearing note cannot be undone"
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let clearAction = UIAlertAction(title: "Clear", style: .Destructive) { (UIAlertAction) -> Void in
            self.titleTextField.text = ""
            self.bodyTextView.text = ""
        }
        alert.addAction(clearAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
       
        // If there is an existing entry - i.e. editing an entry
        if let currentEntry = entry {
            if let currentTitle = titleTextField.text {
                currentEntry.title = currentTitle
            }
            if let currentBodyText = bodyTextView.text {
                currentEntry.bodyText = currentBodyText
            }
            currentEntry.timestamp = getFormattedTimestamp(NSDate())
            
        // If this is a new entry
        } else {
            
                    let newEntry = Entry(timestamp: self.getFormattedTimestamp(NSDate()), title: titleTextField.text!, bodyText: bodyTextView.text)
                    EntryController.sharedController.addEntry(newEntry)
                    self.entry = newEntry
        }
        EntryController.sharedController.saveToPersistantStorage()
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    
    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.bodyText
    }


    
    // MARK: Text Field / Views
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // function to dismiss keyoboard on return
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                textView.resignFirstResponder()
                return false
            }
        return true
    }
    */
    
    
    
    // MARK: Functions
    
    
    func getFormattedTimestamp(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE h:mma - dd/MM/yyyy"
        return dateFormatter.stringFromDate(date)
    }
    

    
    // MARK: Handling Gestures
    
    func handleTextViewSwipe() {
        // self.saveButtonTapped(bodyTextView)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
