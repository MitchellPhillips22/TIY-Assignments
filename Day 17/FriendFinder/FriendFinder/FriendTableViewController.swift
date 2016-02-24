//
//  ViewController.swift
//  FriendFinder
//
//  Created by Mitchell Phillips on 2/23/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

protocol FriendsProtocol {
    func passInfo(friend: Friend)
}

class FriendTableViewController: UIViewController, FriendsProtocol, UITableViewDataSource, UITableViewDelegate {

    var apiCaller: APIController?
    var friendArray = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiCaller = APIController(d: self)
        self.apiCaller?.findFriends()   
        
        
    } // end viewDidLoad
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(friendArray.count)
        let cellForRow = self.friendArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendTableViewCell
        cell.loginLabel.text = cellForRow.login
        cell.nameLabel.text = cellForRow.name
        print(cellForRow.login, "sup")
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    func passInfo(friend: Friend) {
        print("called friend from view controller")
        self.friendArray.append(friend)
        print(friend.name)
    }
    
} // end class
