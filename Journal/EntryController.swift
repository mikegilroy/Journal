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
    
    static let singleton = EntryController()
    
    var entries = [Entry]()
    
    func addEntry(entry: Entry) ->() {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry)->() {
        let index = self.entries.indexOf(entry)
        if let entryIndex = index {
            self.entries.removeAtIndex(entryIndex)

        }
    }
}