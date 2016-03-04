//
//  People.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/3/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class People {
    
    var name: String = ""
    var eyeColor: String = ""
    var skinColor: String = ""
    
    init() {
        
    }
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let eyeColor = dict["eye_color"] as? String {
            self.eyeColor = eyeColor
        }
        if let skinColor = dict["skin_color"] as? String {
            self.skinColor = skinColor 
        }
    }
}