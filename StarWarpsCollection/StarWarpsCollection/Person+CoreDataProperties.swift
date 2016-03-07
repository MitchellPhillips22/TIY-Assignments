//
//  Person+CoreDataProperties.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/6/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var created: NSDate?
    @NSManaged var eyeColor: String?
    @NSManaged var planet: Planet?

}
