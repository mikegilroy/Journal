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
    
    private let entriesKey = "entries"
    
    var entries : [Entry]
    
    init() {
        self.entries = []
        self.loadFromPersistantStorage()
    }
    
    func addEntry(entry: Entry) ->() {
        entries.append(entry)
        self.saveToPersistantStorage()
    }
    
    func saveToPersistantStorage() {
        let entryDictionaries = self.entries.map({$0.dictionaryRepresentation()})
        NSUserDefaults.standardUserDefaults().setValue(entryDictionaries, forKey: entriesKey)
    }
    
    func loadFromPersistantStorage() {
        let entryDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        if let entryDictionaries = entryDictionaryFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
        
    }
    
    
    func removeEntry(entry: Entry)->() {
        let index = self.entries.indexOf(entry)
        if let entryIndex = index {
            self.entries.removeAtIndex(entryIndex)
        }
        self.saveToPersistantStorage()
    }
    
    
}