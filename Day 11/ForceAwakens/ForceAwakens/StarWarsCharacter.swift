//
//  Character.swift
//  ForceAwakens
//
//  Created by Mitchell Phillips on 2/15/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation

class StarWarsCharacter {
    var name: String = ""
    var affiliation: String = ""
    var description: String = ""
    var image: String = ""
    
    init(dict: JSONDictionary) {
    
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let affiliation = dict["affiliation"] as? String {
            self.affiliation = affiliation
        }
        if let description = dict["description"] as? String {
            self.description = description
        }
        if let image = dict["image"] as? String {
            self.image = image
        }
    }
}


