//
//  Planet+CoreDataProperties.swift
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

extension Planet {

    @NSManaged var name: String?
    @NSManaged var population: String?
    @NSManaged var terrain: String?
    @NSManaged var person: Person?
    
  }
