//
//  Note.swift
//  RealmAssignment
//
//  Created by Mitchell Phillips on 3/23/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    
    dynamic var noteDescription: String = ""
    dynamic var user: User?
    dynamic var createdAt: NSDate = NSDate()
    dynamic var updatedAt: NSDate = NSDate()
    
}
