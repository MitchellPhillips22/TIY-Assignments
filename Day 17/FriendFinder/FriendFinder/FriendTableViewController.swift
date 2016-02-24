//
//  ViewController.swift
//  FriendFinder
//
//  Created by Mitchell Phillips on 2/23/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import UIKit

protocol FriendsProtocol {
    func passInfo(friends: [Friends])
}

class FriendTableViewController: UIViewController, FriendsProtocol, UITableViewDataSource, UITableViewDelegate {

    var currentFriend = Friends()
    var apiCaller: APIController?
    var friendArray = [Friends]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiCaller = APIController(d: self)
        self.apiCaller?.findFriends()
        
    } // end viewDidLoad
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print(friendArray.count)
        let f: Friends = self.friendArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath) as! FriendTableViewCell
        cell.loginLabel.text = f.login
        cell.nameLabel.text = f.name
        print(f.login, "sup")
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentFriend = friendArray[indexPath.row]
        performSegueWithIdentifier("detailSegue", sender: self)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue" {
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.detailFriend = self.currentFriend
            print(currentFriend.name)
        }
    }
    
    func passInfo(friends: [Friends]) {
        dispatch_async(dispatch_get_main_queue(), {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            self.tableView.reloadData()})
        
        self.friendArray = friends
       
//        self.tableView.reloadData()
    }
    
} // end class
