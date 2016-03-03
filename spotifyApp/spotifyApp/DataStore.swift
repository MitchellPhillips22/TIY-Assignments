//
//  DataStore.swift
//  spotifyApp
//
//  Created by Mitchell Phillips on 3/2/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    override private init() { }
    
    var arrayOfArtists = [Artist]()
    
    func loadArtists() -> Bool {
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")
        
        if let archivedArtists = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as? [Artist] {
            
            self.arrayOfArtists = archivedArtists
            
            print("Saved in loadArtists()")
            
            debugDump()
            
            return true
        } else {
            print("I had a problem")
        }
        return false
    }
    
    func saveArtists() -> Bool {
        
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")
        
        return NSKeyedArchiver.archiveRootObject(arrayOfArtists, toFile: filePath.path!)
    }
    

    func documentsDirectory() -> NSURL {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory
    }
    
    func debugDump() {
        
        for a in arrayOfArtists {
          print(a.name)
            print(a.arrayOfTracks.count)
        }
    }
    
}
