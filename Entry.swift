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
    init? (dictionary: [String:AnyObject]){
        guard let titleFromDictonary = dictionary["title"] as? String, let bodyTextFromDictonary = dictionary["bodyText"] as? String, let timestampFromDictionary = dictionary ["timestamp"] as? NSDate else{
            self.title = ""
            self.bodyText = ""
            self.timestamp = NSDate()
            return nil
        }
        self.title = titleFromDictonary
        self.bodyText = bodyTextFromDictonary
        self.timestamp = timestampFromDictionary
    }
    func dictionaryRepresentation() ->[String: AnyObject]{
        
        return[
            "title" : self.title,
            "artist" : self.bodyText,
            "timestamp" : self.timestamp
            
        ]
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}