//
//  Event.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/25/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation
import Firebase

class Event {
    
    var key: String = ""
    
    var name: String = ""
    
    var genre: String = ""
    
    var startDate = NSDate()
    
    var endDate = NSDate()
    
    
    var eventRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/events")
    
    init () {
        
    }
    
    
    init(key: String, dict: [String: AnyObject]) {
        
        if let name = dict["name"] as? String {
            
            self.name = name
        } else {
            
            print("couldnt parse name")
        }
        
        if let genre = dict["genre"] as? String {
            
            
            self.genre = genre
        } else {
            
            print("Couldnt print genre")
        }
        
        if let startDate = dict["startDate"] as? NSTimeInterval {
            
            self.startDate = NSDate(timeIntervalSince1970: startDate)
        } else {
            
            print("coudlnt parse startDate")
        }
        
        if let endDate = dict["endDate"] as? NSTimeInterval {
            
            self.endDate = NSDate(timeIntervalSince1970: endDate)
        } else {
            
            print(" cant parse endDate")
        }
    }
    
    func saveEvent() {
        
        
        let dict = [
            "name": self.name,
            "genre": self.genre,
            "startDate": self.startDate,
            "endDate": self.endDate
            
            
        ]
        
        
        let firebaseQuestion = self.eventRef.childByAutoId()
        firebaseQuestion.setValue(dict)
    }
}
