//
//  Entry.swift
//  Journal
//
//  Created by Mike Gilroy on 15/10/2015.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
//    var timestamp = NSDate
    var timestamp: String = "now"
    var title: String
    var bodyText: String
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = title
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.title == rhs.title) && (lhs.bodyText == rhs.bodyText)
}