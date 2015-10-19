//
//  Entry.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation



class Entry: Equatable {
    
    // Create key strings for use when saving as dictionaries in NSUserDefaults
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    private let timestampKey = "timestamp"
    
    // Set standard variables with types
    var timestamp: String
    var title: String
    var bodyText: String
    
    // Initialize all non-optional variables
    init(timestamp: String, title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
    
    // Failable initializer to initialize Entry from dictionary instead of individual variables
    // Use variable key strings to access variable values
    init?(dictionary: [String: AnyObject]) {
        
        // User guard to only return nil if values are not returned from dictionaries
        guard let titleFromDictonary = dictionary[titleKey] as? String, /* must force downcast as variable type */
              let bodyTextFromDictonary = dictionary[bodyTextKey] as? String,
              let timestampFromDictionary = dictionary[timestampKey] as? String else {
            
                
            // BUG: must initialise values even though returning nil
            self.title = ""
            self.bodyText = ""
            self.timestamp = ""
            return nil
        }
        
        // values are all not nil -> so set variable values as normal
        self.title = titleFromDictonary
        self.bodyText = bodyTextFromDictonary
        self.timestamp = timestampFromDictionary
    }
    
    // Function to return dictionary representation of an Entry object
    func dictionaryRepresentation() -> Dictionary<String, AnyObject>  {
        
        let dictionary = [
            titleKey : self.title,
            bodyTextKey : self.bodyText,
            timestampKey : self.timestamp
        ]
        return dictionary
    }
    
}


// Equatable protocol function that equates whether two Entry objects are the same
func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}