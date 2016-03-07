//
//  APIController.swift
//  StarWarpsCollection
//
//  Created by Mitchell Phillips on 3/3/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

import Foundation

class APIController {
    
    var currentPlanet = Planet()
    var currentPerson = Person()
    var arrayOfPeople = [Person]()
    var arrayOfPlanets = [Planet]()
    
func findPlanets() {
    
    let urlString = "http://swapi.co/api/planets/1/"
    
    if let url = NSURL(string: urlString) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print("error, \(error)")
            } else {
                print(data)
            }
            if let data = data {
                do {
                    if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                        if let results = dict["name"] as? JSONDictionary {
                            for result in results {
                                let n = Planet(dict: result)
                                self.arrayOfPlanets.append(n)
                            }
                            
                        }
                    }
                } catch {
                    
                }
            }
        })
        task.resume()
    }
    }
    func findPeople() {
        
        let urlString = "http://swapi.co/api/people/1/"
        
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    print("error, \(error)")
                } else {
                    print(data)
                }
                if let data = data {
                    do {
                        if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                            if let results = dict["name"] as? JSONDictionary {
                                for result in results {
                                    let n = Person(dict: result)
                                    self.arrayOfPeople.append(n)
                                }}
                        }
                    } catch {
                        
                    }
                }
                
            })
            task.resume()
        }

    }
    

}


