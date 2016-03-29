//
//  TimeslotsTableViewController.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/25/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import Firebase

class TimeslotsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var timeSlotArray = [TimeSlot]()
    
    var timeSlotRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/timeslot")

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.timeSlotArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("timeSlotCell") as! TimeslotsTableViewCell
        
        return cell
    }
    
    func observeTimeSlot() {
        
        self.timeSlotRef.observeEventType(.Value, withBlock: {
            
            (snapshot) -> () in
            
            print(snapshot.value)
            
            self.timeSlotArray.removeAll()
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    if let dict = snap.value as? [String: AnyObject] {
                        
                        let key = snap.key
                        
                        let timeslot = TimeSlot(key: key, dict: dict)
                        
                        self.timeSlotArray.insert(timeslot, atIndex: 0)
                        
                    }
                }
            }
            
        })
    }

}
