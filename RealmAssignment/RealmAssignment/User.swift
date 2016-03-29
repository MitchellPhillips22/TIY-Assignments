//
//  User.swift
//  RealmAssignment
//
//  Created by Mitchell Phillips on 3/23/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var username: String = ""
    dynamic var password: String = ""
    dynamic var createdAt: NSDate = NSDate()
    dynamic var updatedAt: NSDate = NSDate()
    
}
