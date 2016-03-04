//
//  Planets.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/3/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class Planet {
    
    var name: String = ""
    var terrain: String = ""
    var population: String = ""
    
    init() {
        
    }
    
    init(dict: JSONDictionary) {
        
        if let population = dict["population"] as? String {
            self.population = population
        }
        if let terrain = dict["terrain"] as? String {
            self.terrain = terrain
        }
        if let name = dict["name"] as? String {
            self.name = name 
        }
    }
}
