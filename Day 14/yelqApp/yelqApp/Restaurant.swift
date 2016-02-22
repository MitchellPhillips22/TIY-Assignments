//
//  Restaurant.swift
//  yelqApp
//
//  Created by Mitchell Phillips on 2/18/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String = ""
    var description: String = ""
    var location: String = ""
    var image: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var menuArray = [Menu]()
    
    init(dict: JSONDictionary) {
    
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let description = dict["description"] as? String {
            self.description = description
        }
        if let location = dict["location"] as? String {
            self.location = location
        }
        if let image = dict["image"] as? String {
            self.image = image
        }
        if let latitude = dict["latitude"] as? Double {
            self.latitude = latitude
        }
        if let longitude = dict["longitude"] as? Double {
            self.longitude = longitude
        }
        if let results = dict["menu"] as? JSONArray {
            for result in results {
                let m = Menu(dict: result)
                self.menuArray.append(m)
                print("menuAppended")
            }
            
        }
        
    }
}