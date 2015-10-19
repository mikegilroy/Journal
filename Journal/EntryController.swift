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
    
    // Create a shared instance of the controller (only one array ever needed)
    static let sharedController = EntryController()
    
    // Create an entriesKey for use when adding to NSUserDefaults
    private let entriesKey = "entries"
    
    // Create entries array variable
    var entries : [Entry]
    
    // Intialise the controller with empty array and loadPersistantStorage
    init() {
        self.entries = []
        self.loadFromPersistantStorage()
    }
    
    // Add entry function to add new entry to entries array - new array saved to persistant storage afterwards
    func addEntry(entry: Entry) ->() {
        entries.append(entry)
        self.saveToPersistantStorage()
    }
    
    // Remove entry function to remove entry from entries array - new array saved to persistant storage afterwards
    func removeEntry(entry: Entry)->() {
        // Need to find index of entry to remove before it can be removed
        let index = self.entries.indexOf(entry)
        if let entryIndex = index {
            self.entries.removeAtIndex(entryIndex)
        }
        self.saveToPersistantStorage()
    }
    
    // Function to save to persistant storage as Dictionaries using NSUserDefaults
    func saveToPersistantStorage() {
        
        // Create dictionary for entries array using 'map' function
        // $0 means start at 0 index in array - so all entries will be processed
        let entryDictionaries = self.entries.map({$0.dictionaryRepresentation()})
        
        // Save new dictionary to NSUserDefaults with setValue:forKey: function and using entriesKey
        NSUserDefaults.standardUserDefaults().setValue(entryDictionaries, forKey: entriesKey)
    }
    
    
    // Function to load from persistant storage as an array of Entries
    func loadFromPersistantStorage() {
        
        // Get entry dictionary from NSUserDefaults using entriesKey
        let entryDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        // If dictionary is not nil, set entries array using dictionaries pulled from NSUserDefaults using map function
        if let entryDictionaries = entryDictionaryFromDefaults {
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
        
    }
    
    
    
    
    
}