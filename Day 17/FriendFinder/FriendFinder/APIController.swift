//
//  APIController.swift
//  FriendFinder
//
//  Created by Mitchell Phillips on 2/23/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation

class APIController {

    var delegate: FriendsProtocol?
    
    init(d: FriendTableViewController) {
        self.delegate = d
    }
    
    func findFriends() {
    
    let urlString = "https://api.github.com/users/MitchellPhillips22"
    
    if let url = NSURL(string: urlString) {
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {
            
            (data, response, error) in
            
            if error != nil {
                print("error, \(error)")
            } else {
                print(data)
                
                if let data = data {
                    
                    do {
                        
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            
                            let f = Friend(dict: dict)
                            print(f.name)
                            self.delegate?.passInfo(f)
                            
                        } else {
                            print("it broke")
                        }
                        
                    } catch {
                        
                    }
                }
            }
        })
        task.resume()
    }

  }
}