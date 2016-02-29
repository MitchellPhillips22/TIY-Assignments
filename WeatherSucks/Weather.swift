//
//  Weather.swift
//  WeatherSucks
//
//  Created by Mitchell Phillips on 2/26/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class Weather {
    
    var temperature: Double = 0
    var summary: String = ""
    var icon: String = ""
    var humidity: Double = 0
    var windSpeed: Double = 0
    var windBearing: Double = 0
    var temperatureMin: Double = 0
    var temperatureMax: Double = 0
    
    init() {
        
    }
    
    init(dict: JSONDictionary) {
        
        if let temperature = dict["temperature"] as? Double {
            self.temperature = temperature
        }
        if let summary = dict["summary"] as? String {
            self.summary = summary
        }
        if let icon = dict["icon"] as? String {
            self.icon = icon
        }
        if let humidity = dict["humidity"] as? Double {
            self.humidity = humidity
        }
        if let windSpeed = dict["windSpeed"] as? Double {
            self.windSpeed = windSpeed
        }
        if let windBearing = dict["windBearing"] as? Double {
            self.windBearing = windBearing
        }
        if let temperatureMin = dict["temperatureMin"] as? Double {
            self.temperatureMin = temperatureMin
        }
        if let temperatureMax = dict["temperatureMax"] as? Double {
            self.temperatureMax = temperatureMax
        }
    }

}
