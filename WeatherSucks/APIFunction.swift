//
//  APIFunction.swift
//  WeatherSucks
//
//  Created by Mitchell Phillips on 2/26/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import UIKit

class APIFunction {
    
    var arrayOfWeather = [Weather]()
    var delegate: WeatherProtocol?
    


    init(d: CityTableViewController) {
        self.delegate = d
    }
    func googleMapsFunction(zipCode: String) {
        
        let googleURL = "http://maps.googleapis.com/maps/api/geocode/json?&components=postal_code:\(zipCode)&sensor=false"
        
        if let url = NSURL(string: googleURL) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print("googleError, \(error)")
                }
                if let data = data {
                    do {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            if let results = dict["results"] as? JSONArray {
                                var lat: Double = 0
                                var long: Double = 0
                                var addressString: String = ""
                                for result in results {
                                    if let address = result["formatted_address"] as? String {
                                        print(address)
                                        addressString = address
                                    }
                                    if let geometry = result["geometry"] as? JSONDictionary {
                                        if let location = geometry["location"] as? JSONDictionary {
                                            if let latitude = location["lat"] as? Double {
                                                lat = latitude
                                            }
                                            if let longitude = location["lng"] as? Double {
                                                long = longitude 
                                            }
                                        }
                                    }
                                }
                                self.delegate?.passGoogleInfo(addressString, lat: lat, long: long)
                            }
                        }
                    } catch {
                        print("couldn't parse google maps")
                    }
                }
            })
            task.resume()
        }
    }
    
    func searchWeather(coordinates: String) {
        
        let urlString = "https://api.forecast.io/forecast/566ac964e5441df4e70bb266f9b09e8a/\(coordinates)"
        
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print("error, \(error)")
                }
                if let data = data {
                    do {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            let c = City()
                            
                            if let results = dict["currently"] as? JSONDictionary {
                                if let temperature = results["temperature"] as? Double {
                                    c.cityTemp = temperature
                                }
                                if let summary = results["summary"] as? String {
                                    c.currentWeather = summary
                                }
                                if let icon = results["icon"] as? String {
                                    c.icon = icon
                                }
                            }
                            if let results = dict["daily"] as? JSONDictionary {
                                if let data = results["data"] as? JSONArray {
                                    for result in data {
                                        let w = Weather(dict: result)
                                       
                                        c.arrayOfWeather.append(w)
                                    print(c.arrayOfWeather.count)
                                    }
                                }
                            }
                            self.delegate?.passWeatherInfo(c)
                        }
                    } catch {
                    }
                }
            })
            task.resume()
        }
    } // end func searchWeather
} // end class
