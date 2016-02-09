//
//  Hero.swift
//  heroTracker
//
//  Created by Mitchell Phillips on 2/8/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation
class Hero {
    var name: String
    var homeworld: String
    var powers: String
    var image: String
    
    init(name: String, homeworld: String, powers: String, image: String) {
        self.name = name
        self.homeworld = homeworld
        self.powers = powers
        self.image = image
    }
}
