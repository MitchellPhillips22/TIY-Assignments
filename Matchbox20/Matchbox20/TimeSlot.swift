//
//  TimeSlot.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/24/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation
import Firebase

class TimeSlot {
    
    var key: String = ""
    var name: String = ""
    var startDate = NSDate()
    var endDate = NSDate()
    var user: User?
    
    var timeSlotRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/timeslot")
    
    init() {
    }
    
    init(key: String, dict: [String: AnyObject]) {
        
        self.key = key
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let startDateInterval = dict["startDate"] as? NSTimeInterval {
            self.startDate = NSDate(timeIntervalSince1970: startDateInterval)
        }
        if let endDateInterval = dict["endDate"] as? NSTimeInterval {
            self.endDate = NSDate(timeIntervalSince1970: endDateInterval)
        }
        if let user = dict["user"] as? User {
            self.user = user
        }
    }
    
    func saveTimeslot() {
        
        let startDateInterval = self.startDate.timeIntervalSince1970
        let endDateInterval = self.endDate.timeIntervalSince1970
        
        
        let dict = [
            "name": self.name,
            "startDate": startDateInterval,
            "endDate": endDateInterval,
            
        ]
        
        let firebaseEvent = self.timeSlotRef.childByAutoId()
        firebaseEvent.setValue(dict)

    }
}

 