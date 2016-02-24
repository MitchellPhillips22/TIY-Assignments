//
//  APIController.swift
//  FriendFinder
//
//  Created by Mitchell Phillips on 2/23/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation

class APIController {

    var arrayOfFriends = [Friends]()
    
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
                            
                            let f = Friends(dict: dict)
                            
                            let x = Friends()
                            x.login = "Amer1c@nSn1per420"
                            x.name = "Chris Kyle"
                            x.email = "FratricideSux@aol.com"
                            
                            let y = Friends()
                            y.login = "xXxSpAcE_GrEmLiNxXx"
                            y.name = "Ted Cruz"
                            y.email = "tedcruzlooksweird@gmail.com"
                            
                            self.arrayOfFriends.append(f)
                            self.arrayOfFriends.append(x)
                            self.arrayOfFriends.append(y)
                            print(f.name)
                            self.delegate?.passInfo(self.arrayOfFriends)
                            
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