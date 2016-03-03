//
//  Artist.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

let kName = "name"
let kImage = "image"
let kIdString = "idString"
let kArrayOfTracks = "arrayOfTracks"

class Artist: NSObject, NSCoding {
    
    var name: String = ""
    var image: String = ""
    var idString: String = ""
    var arrayOfTracks = [Track]()
    
    override init() {
        
    }
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let idString = dict["id"] as? String {
            self.idString = idString
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey(kName) as! String
        self.image = aDecoder.decodeObjectForKey(kImage) as! String
        self.idString = aDecoder.decodeObjectForKey(kIdString) as! String
        self.arrayOfTracks = aDecoder.decodeObjectForKey(kArrayOfTracks) as! [Track]
        
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: kName)
        aCoder.encodeObject(image, forKey: kImage)
        aCoder.encodeObject(idString, forKey: kIdString)
        aCoder.encodeObject(arrayOfTracks, forKey: kArrayOfTracks)
    }
}