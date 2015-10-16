//
//  Entry.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation



class Entry: Equatable {
    private let titleKey = "title"
    private let bodyTextKey = "bodyText"
    private let timestampKey = "timestamp"
    
//    var timestamp = NSDate
    var timestamp: NSDate
    var title: String
    var bodyText: String
    
    init(timestamp: NSDate = NSDate(), title: String, bodyText: String) {
        self.title = title
        self.bodyText = title
        self.timestamp = timestamp
    }
    
    
    init?(dictionary: [String: AnyObject]) {
        guard let titleFromDictonary = dictionary[titleKey] as? String,
              let bodyTextFromDictonary = dictionary[bodyTextKey] as? String,
              let timestampFromDictionary = dictionary[timestampKey] as? NSDate else {
            
            self.title = ""
            self.bodyText = ""
            self.timestamp = NSDate()
            return nil
        }
        self.title = titleFromDictonary
        self.bodyText = bodyTextFromDictonary
        self.timestamp = timestampFromDictionary
    }
    
    
    func dictionaryRepresentation() -> Dictionary<String, AnyObject>  {
        
        let dictionary = [
            titleKey : self.title,
            bodyTextKey : self.bodyText,
            timestampKey : self.timestamp
        ]
        return dictionary
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    // return (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}