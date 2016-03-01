//
//  Cities.swift
//  WeatherSucks
//
//  Created by Mitchell Phillips on 2/26/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class City {
    
    var name: String = ""
    var cityTemp: Double = 0
    var latitude: Double = 0
    var longitude: Double = 0
    var currentWeather: String = ""
    var arrayOfWeather = [Weather]()
    var icon: String = ""
    
    init() {
        
    } // allows you to 
    
    init(dict: JSONDictionary) {
        
      
        if let latitude = dict["latitude"] as? Double {
            self.latitude = latitude
        }
        if let longitude = dict["longitude"] as? Double {
            self.longitude = longitude
        }
        if let currentWeather = dict["current"] as? String {
            self.currentWeather = currentWeather
        }
    
    }
    
}