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
    
    var entry: Entry?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleTextViewSwipe")
        self.bodyTextView.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set title of note when detail view appears
        if let newEntry = entry {
            self.title = newEntry.title
        } else {
            self.title = "New Note"
        }
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
            currentEntry.timestamp = getFormattedTimestamp(NSDate())
        } else {
            let newEntry = Entry(timestamp: self.getFormattedTimestamp(NSDate()), title: self.titleTextField.text!, bodyText: self.bodyTextView.text!)
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
