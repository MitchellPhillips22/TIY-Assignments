//
//  Tracks.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 2/29/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

let kAlbumName = "albumName"
let kSongName = "songName"
let kPopularity = "popularity"

class Track: NSObject, NSCoding {
    
    var albumName: String = ""
    var songName: String = ""
    var popularity: Int = 0
    
    override init() {
        
    }
    
    init(dict: JSONDictionary) {
        

        if let albumItem = dict["album"] as? JSONDictionary {
            if let albumName = albumItem["name"] as? String {
                self.albumName = albumName
                print(self.albumName)
            }
        }
        if let songName = dict["name"] as? String {
            self.songName = songName
            print(self.songName)
        }
        if let popularity = dict["popularity"] as? Int {
            self.popularity = popularity
            print(self.popularity)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        self.albumName = aDecoder.decodeObjectForKey(kAlbumName) as! String
        self.songName = aDecoder.decodeObjectForKey(kSongName) as! String
        self.popularity = aDecoder.decodeIntegerForKey(kPopularity)
        
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(albumName, forKey: kAlbumName)
        aCoder.encodeObject(songName, forKey: kSongName)
        aCoder.encodeInteger(popularity, forKey: kPopularity)
    }
}