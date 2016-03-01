//
//  Artist.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class Artist {
    
    var name: String = ""
    var image: String = ""
    var idString: String = ""
    var arrayOfTracks = [Track]()
    
    init() {
        
    }
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let idString = dict["id"] as? String {
            self.idString = idString
        }
        
    }
}