//
//  EntryController.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//
import UIKit

// import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    var entries = [Entry]()
    
    func addEntry(entry: Entry) ->() {
        entries.append(entry)
    }
    func saveToPersistantStorage() {
        let entryDictonaries = self.entries.map({$0.dictionaryRepresentation()})
        NSUserDefaults.standardUserDefaults().setValue(entryDictonaries, forKey: "Entries")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    func loadFromPersistantStorage() {
        let entryDictionaryFromDefault = NSUserDefaults.standardUserDefaults().objectForKey("Entries") as? [Dictionary<String, AnyObject>]
        if let entryDictionaries = entryDictionaryFromDefault {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
        
    }
    
    
    func removeEntry(entry: Entry)->() {
        let index = self.entries.indexOf(entry)
        if let entryIndex = index {
            self.entries.removeAtIndex(entryIndex)

        }
    }
    
    
}