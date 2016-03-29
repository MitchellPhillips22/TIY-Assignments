//
//  EventsTableViewController.swift
//  Matchbox20
//
//  Created by Mitchell Phillips on 3/25/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit
import Firebase

class EventsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var eventsArray = [Event]()
    
    var eventRef = Firebase(url: "https://matchbox20fanclub.firebaseio.com/events")

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    func observeEvent() {
        
        self.eventRef.observeEventType(.Value, withBlock: {
            
            (snapshot) -> () in
            
            self.eventsArray.removeAll()
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    if let dict = snap.value as? [String: AnyObject] {
                        
                        let key = snap.key
                        
                        let event = Event(key: key, dict: dict)
                        
                        self.eventsArray.insert(event, atIndex: 0)
                    }
                }
            }
        })
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.eventsArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell") as! EventsTableViewCell
        
        return cell
    }
}

